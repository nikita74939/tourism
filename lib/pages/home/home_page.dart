import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';
import '../../utils/constants.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/empty_state_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.appName),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: controller.loadData,
        child: Obx(() {
          if (controller.isLoading.value) {
            return LoadingWidget(message: 'Loading...');
          }

          return ListView(
            padding: EdgeInsets.all(16),
            children: [
              _buildWelcomeCard(),
              SizedBox(height: 24),
              _buildSectionHeader('Popular Destinations'),
              SizedBox(height: 12),
              _buildDestinationsList(),
              SizedBox(height: 24),
              _buildSectionHeader('Upcoming Trips'),
              SizedBox(height: 12),
              _buildUpcomingTrips(),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildWelcomeCard() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryColor, AppColors.primaryDark],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Discover Your Next',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'Adventure!',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        TextButton(
          onPressed: () {},
          child: Text('See All'),
        ),
      ],
    );
  }

  Widget _buildDestinationsList() {
    if (controller.destinations.isEmpty) {
      return EmptyStateWidget(
        icon: Icons.place_outlined,
        title: AppStrings.noDestinations,
      );
    }

    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.destinations.take(5).length,
        itemBuilder: (context, index) {
          final destination = controller.destinations[index];
          return _buildDestinationCard(destination);
        },
      ),
    );
  }

  Widget _buildDestinationCard(destination) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 12),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: destination.displayImage,
                fit: BoxFit.cover,
                width: double.infinity,
                placeholder: (context, url) =>
                    Container(color: Colors.grey[300]),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey[300],
                  child: Icon(Icons.place, size: 40),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    destination.displayCity,
                    style:
                        TextStyle(fontSize: 12, color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingTrips() {
    if (controller.upcomingTrips.isEmpty) {
      return EmptyStateWidget(
        icon: Icons.event_outlined,
        title: AppStrings.noTrips,
        subtitle: 'Start planning your next adventure',
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: controller.upcomingTrips.length,
      itemBuilder: (context, index) {
        final trip = controller.upcomingTrips[index];
        return Card(
          margin: EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.primaryLight,
              child: Icon(Icons.place, color: AppColors.primaryColor),
            ),
            title: Text(trip.destinationName),
            subtitle: Text('${trip.durationInDays} days trip'),
            trailing: Text(trip.statusLabel),
          ),
        );
      },
    );
  }
}
