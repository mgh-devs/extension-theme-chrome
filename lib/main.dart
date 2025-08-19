import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_tab_chrome/views/new_tab_page.dart';

import 'core/services/binding.dart';
import 'core/services/hive_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Vazir', // فونت پیش‌فرض کل برنامه
      ),
      initialBinding: InitialBindings(),
      home: NewTabPage(),
    );
  }
}
