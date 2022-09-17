import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/entity/user.dart';
import '../../posts/widgets/post_list_item.dart';

class UserTopPostBottomSheet extends StatelessWidget {
  const UserTopPostBottomSheet({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25.0),
      height: Get.mediaQuery.size.height,
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
    );
  }
}
