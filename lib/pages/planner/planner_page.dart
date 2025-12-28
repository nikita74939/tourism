import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/planner_controller.dart';
import '../../utils/constants.dart';
import '../../utils/helpers.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/empty_state_widget.dart';
// import '../../routes/app_routes.dart';

class PlannerPage extends StatelessWidget {
  final controller = Get.put(PlannerController());
  final selectedFilter = 'all'.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Trips'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: _showFilterDialog,
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return LoadingWidget();
        }

        if (controller.trips.isEmpty) {
          return EmptyStateWidget(
            icon: Icons.event_outlined,
            title: 'No trips yet',
            subtitle: 'Start planning your adventure!',
            action: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text('Plan a Trip'),
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: controller.trips.length,
          itemBuilder: (context, index) {
            final trip = controller.trips[index];
            return Card(
              margin: EdgeInsets.only(bottom: 16),
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.primaryLight,
                      child: Icon(Icons.place, color: AppColors.primaryColor),
                    ),
                    title: Text(
                      trip.destinationName,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(trip.destinationCity),
                    trailing: Chip(
                      label: Text(trip.statusLabel),
                      backgroundColor: _getStatusColor(trip.status),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
                    child: Row(
                      children: [
                        Icon(Icons.date_range,
                            size: 16, color: AppColors.textSecondary),
                        SizedBox(width: 4),
                        Text(
                          '${Helpers.formatDate(trip.startDate)} - ${Helpers.formatDate(trip.endDate)}',
                          style: TextStyle(
                              color: AppColors.textSecondary, fontSize: 12),
                        ),
                        Spacer(),
                        Text(
                          '${trip.itineraryCount} activities',
                          style: TextStyle(
                              color: AppColors.textSecondary, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 1),
                  ButtonBar(
                    children: [
                      TextButton.icon(
                        onPressed: () => controller.getTripById(trip.id),
                        icon: Icon(Icons.visibility),
                        label: Text('View'),
                      ),
                      TextButton.icon(
                        onPressed: () => _confirmDelete(trip.id),
                        icon: Icon(Icons.delete, color: AppColors.errorColor),
                        label: Text('Delete',
                            style: TextStyle(color: AppColors.errorColor)),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(Icons.add),
        label: Text('New Trip'),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'upcoming':
        return AppColors.infoColor.withOpacity(0.2);
      case 'ongoing':
        return AppColors.successColor.withOpacity(0.2);
      case 'past':
        return AppColors.textHint.withOpacity(0.2);
      default:
        return Colors.grey[200]!;
    }
  }

  void _showFilterDialog() {
    Get.dialog(
      AlertDialog(
        title: Text('Filter Trips'),
        content: Obx(() => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile(
                  title: Text('All Trips'),
                  value: 'all',
                  groupValue: selectedFilter.value,
                  onChanged: (value) {
                    selectedFilter.value = value.toString();
                    controller.getTrips();
                    Get.back();
                  },
                ),
                RadioListTile(
                  title: Text('Upcoming'),
                  value: 'upcoming',
                  groupValue: selectedFilter.value,
                  onChanged: (value) {
                    selectedFilter.value = value.toString();
                    controller.getTrips(status: 'upcoming');
                    Get.back();
                  },
                ),
                RadioListTile(
                  title: Text('Ongoing'),
                  value: 'ongoing',
                  groupValue: selectedFilter.value,
                  onChanged: (value) {
                    selectedFilter.value = value.toString();
                    controller.getTrips(status: 'ongoing');
                    Get.back();
                  },
                ),
                RadioListTile(
                  title: Text('Past'),
                  value: 'past',
                  groupValue: selectedFilter.value,
                  onChanged: (value) {
                    selectedFilter.value = value.toString();
                    controller.getTrips(status: 'past');
                    Get.back();
                  },
                ),
              ],
            )),
      ),
    );
  }

  void _confirmDelete(int id) {
    Get.dialog(
      AlertDialog(
        title: Text('Delete Trip'),
        content: Text('Are you sure you want to delete this trip?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              controller.deleteTrip(id);
            },
            child:
                Text('Delete', style: TextStyle(color: AppColors.errorColor)),
          ),
        ],
      ),
    );
  }
}
