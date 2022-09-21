import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

import '../../../../domain/entity/post.dart';

class PostCommentsBottomSheet extends StatelessWidget {
  const PostCommentsBottomSheet({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25.0),
      // height: Get.mediaQuery.size.height / 2,
      decoration: BoxDecoration(
        color: Get.theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(24.0),
          topLeft: Radius.circular(24.0),
        ),
      ),
      child: Center(
          child: ListView.builder(
        itemBuilder: (context, position) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(UniconsLine.comment_dots),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        "Random text Random text Random text Random text Random text Random text ",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 30),
                        Icon(
                          UniconsLine.thumbs_up,
                          color: post.isLiked
                              ? Get.theme.primaryColor
                              : Get.theme.iconTheme.color,
                        ),
                        const SizedBox(width: 6),
                        Text("${post.likeCount} likes"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: 20,
      )),
    );
  }
}
