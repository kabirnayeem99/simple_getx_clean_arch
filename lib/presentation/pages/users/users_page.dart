import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_getx_clean_arch/presentation/controllers/users/user_controller.dart';
import 'package:simple_getx_clean_arch/presentation/pages/posts/widgets/post_list_item.dart';

class UsersPage extends StatelessWidget {
  final controller = UserController()..loadUsers();

  UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final uiState = controller.uiState.value;
    return ListView.builder(
      itemCount: uiState.users.length,
      itemBuilder: (context, position) {
        final user = uiState.users[position];
        return ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Get.theme.focusColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: const Icon(Icons.person_outline_rounded),
          ),
          title: Text(user.name),
          subtitle: Text(user.username),
          onTap: () => Get.bottomSheet(Container(
            padding: const EdgeInsets.all(25.0),
            height: Get.mediaQuery.size.height / 2,
            decoration: BoxDecoration(
              color: Get.theme.scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8.0),
                topLeft: Radius.circular(8.0),
              ),
            ),
            child: ListView.builder(
              itemBuilder: (context, position) {
                final post = user.topPosts[position];
                return PostListItem(post: post);
              },
              itemCount: user.topPosts.length,
            ),
          )),
        );
      },
    );
  }
}
