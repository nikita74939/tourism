import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../../storage/local_storage.dart';
import '../../utils/constants.dart';

class SplashPage extends StatelessWidget {
  final _storage = LocalStorage();

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      if (_storage.isLoggedIn()) {
        Get.offAllNamed(AppRoutes.mainNavigation);
      } else {
        Get.offAllNamed(AppRoutes.login);
      }
    });

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.flight_takeoff, size: 100, color: Colors.white),
            SizedBox(height: 24),
            Text(
              AppConstants.appName,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Explore the World',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
