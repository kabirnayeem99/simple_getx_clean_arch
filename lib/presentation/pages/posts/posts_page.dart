import 'package:flutter/material.dart';

import '../../controllers/posts/post_controller.dart';
import 'widgets/post_list_item.dart';

class PostsPage extends StatelessWidget {
  PostsPage({Key? key}) : super(key: key);

  final postController = PostController()..loadPosts();

  @override
  Widget build(BuildContext context) {
    final uiState = postController.uiState.value;
    return uiState.isLoading
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: uiState.posts.length,
            itemBuilder: (context, position) =>
                PostListItem(post: uiState.posts[position]),
          );
  }
}
