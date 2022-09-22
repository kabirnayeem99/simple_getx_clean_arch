import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

import '../posts/posts_page.dart';
import '../users/users_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _currentPage = 0.obs;
  final _pageController = PageController();

  static final List<BottomBarItem> _bottomNavBarItems = [
    BottomBarItem(
      icon: const Icon(UniconsLine.newspaper),
      activeColor: Get.theme.primaryColor,
    ),
    BottomBarItem(
      icon: const Icon(UniconsLine.users_alt),
      activeColor: Get.theme.primaryColor,
    ),
  ];

  static final List<Widget> _screens = [
    PostsPage(),
    UsersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    SVProgressHUD.setRingThickness(3.5);
    SVProgressHUD.setForegroundColor(Get.theme.primaryColor);

    return Obx(
      () => Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
              left: Get.mediaQuery.size.width / 4.5,
              right: Get.mediaQuery.size.width / 4.5,
              top: 8.0),
          child: BottomBar(
            padding: const EdgeInsets.only(bottom: 24.0),
            border: const StadiumBorder(),
            onTap: (index) {
              _currentPage.value = index;
              _pageController.animateToPage(
                index,
                duration: 300.milliseconds,
                curve: Curves.easeInOut,
              );
            },
            items: _bottomNavBarItems,
            selectedIndex: _currentPage.value,
          ),
        ),
        body: PageView(
          onPageChanged: (index) => _currentPage.value = index,
          controller: _pageController,
          children: _screens,
        ),
      ),
    );
  }
}
