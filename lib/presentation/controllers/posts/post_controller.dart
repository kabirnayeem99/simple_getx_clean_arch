import 'package:get/get.dart';

import '../../../domain/entity/post.dart';
import '../../uistates/posts/posts_ui_state.dart';

class PostController extends GetxController {
  final uiState = Rx<PostUiState>(PostUiState.init());

  Future<void> loadPosts({int page = 1}) async {
    final posts = Post.mockPosts();

    final existingPosts = uiState.value.posts.toList(growable: true);
    existingPosts.addAll(posts);

    uiState.update((state) {
      state?.posts = existingPosts;
      state?.isLoading = false;
    });
  }
}
