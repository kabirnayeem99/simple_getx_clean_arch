import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_getx_clean_arch/presentation/pages/home/home_page.dart';

void main() {
  runApp(const PlaceHolderApp());
}

class PlaceHolderApp extends StatelessWidget {
  const PlaceHolderApp({super.key});

  @override
  Widget build(BuildContext context) {
    SVProgressHUD.setRingThickness(3.5);
    SVProgressHUD.setForegroundColor(Get.theme.primaryColor);
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: GoogleFonts.ubuntu().fontFamily,
      ),
      home: HomePage(),
    );
  }
}
