import 'package:get/get.dart';
import 'package:tourism/controllers/auth_controller.dart';

class ProfileController extends GetxController {
  late AuthController authC;

  @override
  void onInit() {
    authC = Get.find<AuthController>();
    super.onInit();
  }

  void logout() {
    authC.logout();
  }
}
