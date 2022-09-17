import 'package:get/get.dart';
import 'package:simple_getx_clean_arch/presentation/controllers/posts/post_controller.dart';

class PostBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PostController(), permanent: true);
  }
}
