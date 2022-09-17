import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/entity/post.dart';
import '../../details/details_page.dart';
import 'post_details_bottom_sheet.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Theme.of(context).highlightColor,
        ),
      ),
      child: ListTile(
        title: Text(post.title),
        subtitle: post.type == PostType.text
            ? Text(
                post.body,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(post.thumbnail),
              ),
        leading: const Icon(Icons.newspaper_rounded),
        trailing: GestureDetector(
          onTap: () => Get.bottomSheet(
            PostDetailsBottomSheet(post: post),
          ),
          child: const Icon(Icons.arrow_drop_down_circle_outlined),
        ),
        onTap: () => Get.to(const DetailsPage(), arguments: post),
      ),
    );
  }
}
