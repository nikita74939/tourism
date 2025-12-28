import 'package:get/get.dart';
import '../models/destination_model.dart';
import '../models/trip_model.dart';
import '../services/api_service.dart';

class HomeController extends GetxController {
  final _api = ApiService();

  final destinations = <DestinationModel>[].obs;
  final upcomingTrips = <TripModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    await Future.wait([
      getDestinations(),
      getUpcomingTrips(),
    ]);
  }

  Future<void> getDestinations() async {
    try {
      isLoading.value = true;
      final response = await _api.get('/destinations');
      final List data = response.data['data'];
      destinations.value =
          data.map((e) => DestinationModel.fromJson(e)).toList();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getUpcomingTrips() async {
    try {
      final response =
          await _api.get('/trips', queryParameters: {'status': 'upcoming'});
      final List data = response.data['data'];
      upcomingTrips.value = data.map((e) => TripModel.fromJson(e)).toList();
    } catch (e) {
      print('Error loading trips: $e');
    }
  }
}
