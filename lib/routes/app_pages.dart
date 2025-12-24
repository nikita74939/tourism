import 'package:get/get.dart';
import '../pages/splash/splash_page.dart';
import '../pages/auth/login_page.dart';
import '../pages/home/home_page.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.splash, page: () => const SplashPage()),
    GetPage(name: Routes.login, page: () => const LoginPage()),
    GetPage(name: Routes.home, page: () => const HomePage()),
  ];
}
