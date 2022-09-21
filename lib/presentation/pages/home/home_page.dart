import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

import '../posts/posts_page.dart';
import '../users/users_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final currentPage = 0.obs;

  static const List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(UniconsLine.newspaper),
      label: "Posts",
    ),
    BottomNavigationBarItem(
      icon: Icon(UniconsLine.users_alt),
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
        bottomNavigationBar: BottomNavigationBar(
          onTap: (position) => currentPage.value = position,
          elevation: 0.0,
          selectedFontSize: 14.0,
          unselectedFontSize: 14.0,
          currentIndex: currentPage.value,
          items: _bottomNavBarItems,
        ),
        body: AnimatedContainer(
          duration: 600.milliseconds,
          child: screens[currentPage.value],
        ),
      ),
    );
  }
}
