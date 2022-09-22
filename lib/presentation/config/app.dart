import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/home/home_page.dart';
import 'color_schemes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      home: HomePage(),
    );
  }
}
