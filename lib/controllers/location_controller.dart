import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location_service.dart';

class LocationController extends GetxController {
  final _locationService = LocationService();

  final currentPosition = Rx<Position?>(null);
  final currentAddress = ''.obs;
  final isLoading = false.obs;

  Future<void> getCurrentLocation() async {
    try {
      isLoading.value = true;
      final position = await _locationService.getCurrentLocation();
      if (position != null) {
        currentPosition.value = position;
        final address = await _locationService.getAddressFromCoordinates(
          position.latitude,
          position.longitude,
        );
        currentAddress.value = address ?? 'Unknown location';
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
