import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/entity/post.dart';

class PostDetailsBottomSheet extends StatelessWidget {
  const PostDetailsBottomSheet({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25.0),
      height: Get.mediaQuery.size.height / 2,
      decoration: BoxDecoration(
        color: Get.theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8.0),
          topLeft: Radius.circular(8.0),
        ),
      ),
      child: Center(
        child: Text(
          post.toString(),
          style: const TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
