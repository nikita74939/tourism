import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism/services/auth_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: authC.loginDummy,
          child: const Text('Login'),
        ),
      ),
    );
  }
}
