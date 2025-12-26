import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/trip_controller.dart';

class TripTab extends StatelessWidget {
  const TripTab({super.key});

  @override
  Widget build(BuildContext context) {
    final tripC = Get.put(TripController());

    return Scaffold(
      appBar: AppBar(title: const Text('My Trips')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => tripC.addTrip('Trip ${tripC.trips.length + 1}'),
        child: const Icon(Icons.add),
      ),

      body: Obx(
        () => ListView(
          children:
              tripC.trips.map((trip) => ListTile(title: Text(trip))).toList(),
        ),
      ),
    );
  }
}
