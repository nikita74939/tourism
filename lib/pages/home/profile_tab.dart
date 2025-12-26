import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism/controllers/profile_controller.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final profileC = Get.put(ProfileController());

    return Center(
      child: ElevatedButton(
        onPressed: profileC.logout,
        child: const Text('Logout'),
      ),
    );
  }
}
