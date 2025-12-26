import 'package:get/get.dart';
import 'package:tourism/controllers/auth_controller.dart';
import 'package:tourism/routes/app_routes.dart';

class SplashController extends GetxController {
  final authC = Get.find<AuthController>();

  @override
  void onReady() {
    super.onReady();

    Future.delayed(const Duration(seconds: 1), () {
      if (authC.isLoggedIn.value) {
        Get.offAllNamed(Routes.home);
      } else {
        Get.offAllNamed(Routes.login);
      }
    });
  }
}
