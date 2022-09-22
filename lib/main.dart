import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_getx_clean_arch/core/servicelocator/service_locator.dart';
import 'package:simple_getx_clean_arch/presentation/config/color_schemes.dart';
import 'package:simple_getx_clean_arch/presentation/pages/home/home_page.dart';

void main() async {
  ServiceLocator.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final darkTheme = ThemeData.dark().copyWith(
      primaryColor: const Color(0xFFffd9d9),
      colorScheme: darkColorScheme,
      useMaterial3: true,
    );

    final lightTheme = ThemeData.light().copyWith(
      primaryColor: const Color(0xFFff5b5b),
      colorScheme: lightColorScheme,
      useMaterial3: true,
    );

    return GetMaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      home: HomePage(),
    );
  }
}
