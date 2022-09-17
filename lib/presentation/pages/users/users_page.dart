import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_getx_clean_arch/presentation/pages/posts/widgets/post_list_item.dart';

import '../../../domain/entity/user.dart';

class UsersPage extends StatelessWidget {
  final List<User> users = User.mockUsers();

  UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, position) {
        final user = users[position];
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
