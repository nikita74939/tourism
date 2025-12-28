import 'package:get/get.dart';
import '../models/trip_model.dart';
import '../services/api_service.dart';
// import '../models/itinerary_model.dart';

class PlannerController extends GetxController {
  final _api = ApiService();

  final trips = <TripModel>[].obs;
  final selectedTrip = Rx<TripModel?>(null);
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getTrips();
  }

  Future<void> getTrips({String? status}) async {
    try {
      isLoading.value = true;
      final queryParams = status != null ? {'status': status} : null;
      final response = await _api.get('/trips', queryParameters: queryParams);
      final List data = response.data['data'];
      trips.value = data.map((e) => TripModel.fromJson(e)).toList();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getTripById(int id) async {
    try {
      final response = await _api.get('/trips/$id');
      selectedTrip.value = TripModel.fromJson(response.data['data']);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> createTrip({
    required int destinationId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      isLoading.value = true;
      await _api.post('/trips', data: {
        'destination_id': destinationId,
        'start_date': startDate.toIso8601String(),
        'end_date': endDate.toIso8601String(),
      });
      await getTrips();
      Get.back();
      Get.snackbar('Success', 'Trip created successfully');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteTrip(int id) async {
    try {
      await _api.delete('/trips/$id');
      await getTrips();
      Get.snackbar('Success', 'Trip deleted successfully');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> addItinerary({
    required int tripId,
    required String title,
    required DateTime activityTime,
    String? notes,
  }) async {
    try {
      await _api.post('/itineraries', data: {
        'trip_id': tripId,
        'title': title,
        'activity_time': activityTime.toIso8601String(),
        'notes': notes,
      });
      await getTripById(tripId);
      Get.back();
      Get.snackbar('Success', 'Itinerary added successfully');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
