import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

import '../../controllers/posts/post_controller.dart';
import 'widgets/make_a_post_button.dart';
import 'widgets/post_list_item.dart';

class PostsPage extends StatelessWidget {
  PostsPage({Key? key}) : super(key: key);

  final postListController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: Get.find<PostController>(),
      builder: (controller) {
        final uiState = controller.uiState.value;

        uiState.isLoading ? SVProgressHUD.show() : SVProgressHUD.dismiss();

        return SafeArea(
          child: Scaffold(
            floatingActionButton: FloatingActionButton.small(
              onPressed: () => postListController.animateTo(
                0,
                duration: 600.milliseconds,
                curve: Curves.easeIn,
              ),
              child: const Icon(
                UniconsLine.angle_up,
                color: Colors.white,
              ),
            ),
            body: Column(
              children: [
                const MakeAPostButton(),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: ListView.builder(
                      itemCount: uiState.posts.length,
                      itemBuilder: (context, position) => PostListItem(
                        post: uiState.posts[position],
                      ),
                      controller: postListController
                        ..addListener(
                          () => (postListController.position.maxScrollExtent ==
                                  postListController.offset)
                              ? controller.loadPosts()
                              : {},
                        ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
