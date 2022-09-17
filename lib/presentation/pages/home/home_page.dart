import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../posts/posts_page.dart';
import '../users/users_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final currentPage = 0.obs;

  static const List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.newspaper_rounded,
      ),
      label: "Posts",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.supervised_user_circle_rounded,
      ),
      label: "Users",
    )
  ];

  static List<Widget> screens = [
    PostsPage(),
    UsersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(title: const Text("{JSON}Placeholder")),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (position) => currentPage.value = position,
          currentIndex: currentPage.value,
          items: _bottomNavBarItems,
        ),
        body: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          child: screens[currentPage.value],
        ),
      ),
    );
  }
}
