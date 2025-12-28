import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import '../models/destination_model.dart';
import '../services/api_service.dart';
import '../services/location_service.dart';

class ExploreController extends GetxController {
  final _api = ApiService();
  final _locationService = LocationService();

  final destinations = <DestinationModel>[].obs;
  final nearbyDestinations = <DestinationModel>[].obs;
  final isLoading = false.obs;
  final currentPosition = Rx<Position?>(null);

  @override
  void onInit() {
    super.onInit();
    getAllDestinations();
    getCurrentLocation();
  }

  Future<void> getAllDestinations() async {
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

  Future<void> searchDestinations(String query) async {
    try {
      isLoading.value = true;
      final response =
          await _api.get('/destinations', queryParameters: {'search': query});
      final List data = response.data['data'];
      destinations.value =
          data.map((e) => DestinationModel.fromJson(e)).toList();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      final position = await _locationService.getCurrentLocation();
      if (position != null) {
        currentPosition.value = position;
        await getNearbyDestinations(position.latitude, position.longitude);
      }
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  Future<void> getNearbyDestinations(double lat, double lng,
      {double radius = 50}) async {
    try {
      final response = await _api.get('/destinations/nearby', queryParameters: {
        'latitude': lat,
        'longitude': lng,
        'radius': radius,
      });
      final List data = response.data['data'];
      nearbyDestinations.value =
          data.map((e) => DestinationModel.fromJson(e)).toList();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
