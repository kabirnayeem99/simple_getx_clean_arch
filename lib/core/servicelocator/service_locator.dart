import 'package:get/get.dart';

import '../../data/datasources/local_posts_data_source.dart';
import '../../data/datasources/remote_posts_data_source.dart';
import '../../data/datasources/remote_user_data_source.dart';
import '../../data/providers/database/local_database_service.dart';
import '../../data/repositories/posts_repository_impl.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/repositories/posts_repository.dart';
import '../../domain/repositories/user_repository.dart';
import '../../presentation/controllers/posts/post_controller.dart';
import '../../presentation/controllers/users/user_controller.dart';

class ServiceLocator {
  static init() {
    Get.lazyPut(() => RemotePostsDataSource());
    Get.lazyPut(() => RemoteUserDataSource());
    Get.lazyPut<PostsRepository>(
      () => PostRepositoryImpl(
          Get.find<RemotePostsDataSource>(), Get.find<LocalPostsDataSource>()),
    );
    Get.lazyPut<UserRepository>(
      () => UserRepositoryImpl(Get.find<RemoteUserDataSource>()),
    );
    Get.lazyPut(() => PostController(Get.find<PostsRepository>()));
    Get.lazyPut(() => UserController(Get.find<UserRepository>()));
    Get.lazyPut(() => LocalDatabaseService());
    Get.lazyPut(() => LocalPostsDataSource(Get.find<LocalDatabaseService>()));
  }
}
