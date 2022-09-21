import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:get/get.dart';

import '../../controllers/posts/post_controller.dart';
import 'widgets/post_list_item.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(
        init: Get.find<PostController>(),
        builder: (controller) {
          final uiState = controller.uiState.value;

          if (uiState.isLoading) {
            SVProgressHUD.show();
          } else {
            SVProgressHUD.dismiss(delay: 600.milliseconds);
          }

          return ListView.builder(
            itemCount: uiState.posts.length,
            itemBuilder: (context, position) => PostListItem(
              post: uiState.posts[position],
            ),
          );
        });
  }
}
