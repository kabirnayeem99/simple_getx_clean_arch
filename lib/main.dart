import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_getx_clean_arch/presentation/pages/home/home_page.dart';

void main() {
  runApp(const PlaceHolderApp());
}

class PlaceHolderApp extends StatelessWidget {
  const PlaceHolderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
    );
  }
}
