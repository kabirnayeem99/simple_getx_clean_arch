import 'package:get/get.dart';
import 'package:simple_getx_clean_arch/data/datasources/remote_posts_data_source.dart';
import 'package:simple_getx_clean_arch/data/repositories/posts_repository_impl.dart';

import '../../domain/repositories/posts_repository.dart';
import '../../presentation/controllers/posts/post_controller.dart';

class ServiceLocator {
  static init() {
    Get.lazyPut(() => RemotePostsDataSource());
    Get.lazyPut<PostsRepository>(
        () => PostRepositoryImpl(Get.find<RemotePostsDataSource>()));
    Get.lazyPut(() => PostController(Get.find<PostsRepository>()));
  }
}
