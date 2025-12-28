import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/explore_controller.dart';
import '../../utils/constants.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/custom_textfield.dart';

class ExplorePage extends StatelessWidget {
  final controller = Get.put(ExploreController());
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Explore Destinations')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: CustomTextField(
              controller: searchController,
              hintText: 'Search destinations...',
              prefixIcon: Icons.search,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  controller.searchDestinations(value);
                } else {
                  controller.getAllDestinations();
                }
              },
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return LoadingWidget();
              }

              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: controller.destinations.length,
                itemBuilder: (context, index) {
                  final dest = controller.destinations[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: Icon(Icons.place, color: AppColors.primaryColor),
                      title: Text(dest.name),
                      subtitle: Text(dest.displayCity),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {},
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.getCurrentLocation,
        child: Icon(Icons.my_location),
      ),
    );
  }
}
