import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/navigation_controller.dart';
import 'home_tab.dart';
import 'map_tab.dart';
import 'trip_tab.dart';
import 'profile_tab.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final navC = Get.put(NavigationController());

    return Scaffold(
      body: PageView(
        controller: navC.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [HomeTab(), MapTab(), TripTab(), ProfileTab()],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: navC.currentIndex.value,
          onTap: navC.changeTab,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
            BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Trip'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
