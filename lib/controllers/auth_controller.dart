import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../routes/app_routes.dart';

class AuthController extends GetxController {
  final isLoggedIn = false.obs;

  @override
  void onInit() {
    checkLogin();
    super.onInit();
  }

  Future<void> checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null) {
      isLoggedIn.value = true;
      Get.offAllNamed(Routes.home);
    } else {
      Get.offAllNamed(Routes.login);
    }
  }

  Future<void> loginDummy() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', 'dummy_token');

    isLoggedIn.value = true;
    Get.offAllNamed(Routes.home);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');

    isLoggedIn.value = false;
    Get.offAllNamed(Routes.login);
  }
}
