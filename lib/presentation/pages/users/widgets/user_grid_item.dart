import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/entity/user.dart';
import '../../../controllers/users/user_controller.dart';
import 'user_top_post_bottom_sheet.dart';

class UserGridItem extends StatelessWidget {
  final User user;
  final UserController controller = Get.find();

  UserGridItem({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: CachedNetworkImage(
                imageUrl: user.imageUrl,
                width: 375.0,
                height: 500.0,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                    strokeWidth: 3.5,
                  ),
                ),
                errorWidget: (context, url, error) => Icon(
                  CupertinoIcons.download_circle_fill,
                  color: Get.theme.errorColor,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 200.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Get.theme.primaryColor,
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 80.0,
                margin: const EdgeInsets.only(
                  left: 12.0,
                  right: 12.0,
                  bottom: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 140.0,
                          child: Text(
                            user.name,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      user.username,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => user.topPosts.isNotEmpty
                    ? Get.bottomSheet(UserTopPostBottomSheet(user: user))
                    : {},
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0, right: 12.0),
                  child: Icon(
                    CupertinoIcons.bolt_circle,
                    color: user.topPosts.isEmpty
                        ? Colors.transparent
                        : Colors.yellow,
                    size: 24.0,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () async => controller.followUser(user.id),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 22.0, right: 12.0),
                  child: Icon(
                    user.isFollowing
                        ? CupertinoIcons.person_crop_circle_fill_badge_checkmark
                        : CupertinoIcons.person_add,
                    size: 28.0,
                    color: user.isFollowing ? Colors.greenAccent : Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
