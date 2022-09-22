import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'core/servicelocator/service_locator.dart';
import 'presentation/config/app.dart';

void main() async {
  ServiceLocator.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}
