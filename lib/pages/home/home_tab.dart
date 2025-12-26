import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final homeC = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(title: const Text('Explore')),
      body: Obx(() {
        if (homeC.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: homeC.destinations.length,
          itemBuilder: (context, index) {
            final dest = homeC.destinations[index];
            return ListTile(
              title: Text(dest.name),
              subtitle: Text(dest.location),
              trailing: Text('⭐ ${dest.rating}'),
            );
          },
        );
      }),
    );
  }
}
