import 'package:get/get.dart';

class TripController extends GetxController {
  final trips = <String>[].obs;

  void addTrip(String trip) {
    trips.add(trip);
  }
}
