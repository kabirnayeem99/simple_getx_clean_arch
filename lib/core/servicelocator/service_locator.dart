import 'package:get/get.dart';
import 'package:simple_getx_clean_arch/data/datasources/remote_posts_data_source.dart';
import 'package:simple_getx_clean_arch/data/datasources/remote_user_data_source.dart';
import 'package:simple_getx_clean_arch/data/repositories/posts_repository_impl.dart';
import 'package:simple_getx_clean_arch/data/repositories/user_repository_impl.dart';
import 'package:simple_getx_clean_arch/domain/repositories/user_repository.dart';
import 'package:simple_getx_clean_arch/presentation/controllers/users/user_controller.dart';

import '../../domain/repositories/posts_repository.dart';
import '../../presentation/controllers/posts/post_controller.dart';

class ServiceLocator {
  static init() {
    Get.lazyPut(() => RemotePostsDataSource());
    Get.lazyPut(() => RemoteUserDataSource());
    Get.lazyPut<PostsRepository>(
        () => PostRepositoryImpl(Get.find<RemotePostsDataSource>()));
    Get.lazyPut<UserRepository>(
        () => UserRepositoryImpl(Get.find<RemoteUserDataSource>()));
    Get.lazyPut(() => PostController(Get.find<PostsRepository>()));
    Get.lazyPut(() => UserController(Get.find<UserRepository>()));

  }
}
