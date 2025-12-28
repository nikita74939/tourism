import 'package:get/get.dart';
import '../pages/splash/splash_page.dart';
import '../pages/auth/login_page.dart';
import '../pages/auth/register_page.dart';
import '../pages/home/home_page.dart';
import '../pages/home/main_navigation_page.dart';
import '../pages/explore/explore_page.dart';
import '../pages/explore/map_page.dart';
import '../pages/planner/planner_page.dart';
import '../pages/planner/add_itinerary_page.dart';
import '../pages/profile/profile_page.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashPage(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: AppRoutes.mainNavigation,
      page: () => MainNavigationPage(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: AppRoutes.explore,
      page: () => ExplorePage(),
    ),
    GetPage(
      name: AppRoutes.map,
      page: () => MapPage(),
    ),
    GetPage(
      name: AppRoutes.planner,
      page: () => PlannerPage(),
    ),
    GetPage(
      name: AppRoutes.addItinerary,
      page: () => AddItineraryPage(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfilePage(),
    ),
  ];
}
