import 'package:get/get.dart';
import 'auth_controller.dart';

class ProfileController extends GetxController {
  final authController = Get.find<AuthController>();

  String get userName => authController.user.value?.name ?? 'User';
  String get userEmail => authController.user.value?.email ?? '';

  void logout() {
    authController.logout();
  }

  void refreshProfile() {
    authController.getProfile();
  }
}
