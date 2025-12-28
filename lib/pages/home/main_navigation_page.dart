import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants.dart';
import 'home_page.dart';
import '../explore/explore_page.dart';
import '../planner/planner_page.dart';
import '../profile/profile_page.dart';

class MainNavigationPage extends StatelessWidget {
  final _selectedIndex = 0.obs;

  final List<Widget> _pages = [
    HomePage(),
    ExplorePage(),
    PlannerPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: _pages[_selectedIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex.value,
            onTap: (index) => _selectedIndex.value = index,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.textSecondary,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: AppStrings.home,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined),
                activeIcon: Icon(Icons.explore),
                label: AppStrings.explore,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_outlined),
                activeIcon: Icon(Icons.calendar_today),
                label: AppStrings.planner,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined),
                activeIcon: Icon(Icons.person),
                label: AppStrings.profile,
              ),
            ],
          ),
        ));
  }
}
