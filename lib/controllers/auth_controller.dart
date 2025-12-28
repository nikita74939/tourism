import 'package:get/get.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';
import '../storage/local_storage.dart';
import '../routes/app_routes.dart';
import '../utils/constants.dart';

class AuthController extends GetxController {
  final _authService = AuthService();
  final _storage = LocalStorage();

  final Rx<UserModel?> user = Rx<UserModel?>(null);
  final isLoading = false.obs;
  final isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  void checkLoginStatus() {
    isLoggedIn.value = _storage.isLoggedIn();
    final userData = _storage.getUser();
    if (userData != null) {
      user.value = UserModel.fromJson(userData);
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;

      final response = await _authService.register(
        name: name,
        email: email,
        password: password,
      );

      if (response.success && response.token != null) {
        await _storage.saveToken(response.token!);
        await _storage.saveUser(response.user!.toJson());
        await _storage.setLoggedIn(true);

        user.value = response.user;
        isLoggedIn.value = true;

        Get.offAllNamed(AppRoutes.mainNavigation);
        Get.snackbar('Success', AppStrings.registerSuccess);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;

      final response = await _authService.login(
        email: email,
        password: password,
      );

      if (response.success && response.token != null) {
        await _storage.saveToken(response.token!);
        await _storage.saveUser(response.user!.toJson());
        await _storage.setLoggedIn(true);

        user.value = response.user;
        isLoggedIn.value = true;

        Get.offAllNamed(AppRoutes.mainNavigation);
        Get.snackbar('Success', AppStrings.loginSuccess);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      await _storage.clearAll();
      user.value = null;
      isLoggedIn.value = false;

      Get.offAllNamed(AppRoutes.login);
      Get.snackbar('Success', AppStrings.logoutSuccess);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> getProfile() async {
    try {
      final profile = await _authService.getProfile();
      user.value = profile;
      await _storage.saveUser(profile.toJson());
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
