import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism/controllers/auth_controller.dart';
import 'routes/app_routes.dart';
import 'routes/app_pages.dart';

void main() {
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tourism',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      getPages: AppPages.pages,
    );
  }
}
