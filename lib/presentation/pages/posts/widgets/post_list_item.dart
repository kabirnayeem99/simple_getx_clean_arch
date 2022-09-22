import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:simple_getx_clean_arch/presentation/controllers/posts/post_controller.dart';
import 'package:simple_getx_clean_arch/presentation/pages/posts/widgets/post_comments_bottom_sheet.dart';
import 'package:unicons/unicons.dart';

import '../../../../domain/entity/post.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Text(
              post.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 12),
          post.type == PostType.text
              ? Container(
                  height: 200,
                  margin: const EdgeInsets.symmetric(horizontal: 12.0),
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: Get.theme.primaryColor.withAlpha(40),
                  ),
                  child: Center(
                    child: Text(
                      post.body,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : Container(
                  height: 200,
                  margin: const EdgeInsets.symmetric(horizontal: 12.0),
                  width: Get.mediaQuery.size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24.0),
                    child: Container(
                      color: Get.theme.primaryColor.withAlpha(40),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                        child: CachedNetworkImage(
                          imageUrl: post.thumbnail,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) {
                            print(error.toString());
                            return Container(
                              color: Get.theme.primaryColor.withAlpha(40),
                            );
                          },
                          progressIndicatorBuilder: (context, url, progress) =>
                              Container(
                            color: Get.theme.primaryColor.withAlpha(40),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        Get.find<PostController>().likePost(post.id);
                        Get.snackbar(
                          "Success",
                          "You have ${post.isLiked ? "unliked" : "liked"} ${post.title}...",
                          borderRadius: 24.0,
                          barBlur: 0,
                          borderWidth: 0.8,
                          borderColor: Get.theme.primaryColor.withAlpha(80),
                          backgroundColor: Get.theme.cardColor,
                        );
                      },
                      child: Icon(
                        UniconsLine.thumbs_up,
                        color: post.isLiked
                            ? Get.theme.primaryColor
                            : Get.theme.iconTheme.color,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text("${post.likeCount} likes"),
                  ],
                ),
                GestureDetector(
                  onTap: () async =>
                      Get.bottomSheet(PostCommentsBottomSheet(post: post)),
                  child: Row(
                    children: const [
                      Icon(UniconsLine.comment),
                      SizedBox(width: 6),
                      Text("32 comments"),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  child: const Icon(UniconsLine.upload),
                  onTap: () => Share.share(post.toUserFriendlyString()),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
