import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_tab_chrome/views/new_tab_page.dart';

import 'core/services/binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      home: NewTabPage(),
    );
  }
}
