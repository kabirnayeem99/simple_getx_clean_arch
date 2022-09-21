import 'package:get/get.dart';
import 'package:simple_getx_clean_arch/domain/repositories/posts_repository.dart';

import '../../uistates/posts/posts_ui_state.dart';

class PostController extends GetxController {
  final PostsRepository _postsRepository;

  PostController(this._postsRepository);

  final uiState = Rx<PostUiState>(PostUiState.init());

  @override
  void onInit() {
    super.onInit();
    loadPosts();
  }

  Future<void> loadPosts({int page = 1}) async {
    final posts = await _postsRepository.getAllPosts();

    final existingPosts = uiState.value.posts.toList(growable: true);
    existingPosts.addAll(posts);

    uiState.update((state) {
      state?.posts = existingPosts;
      state?.isLoading = false;
    });
  }
}
