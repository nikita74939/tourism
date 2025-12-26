import 'package:get/get.dart';
import '../models/destination_model.dart';

class HomeController extends GetxController {
  final destinations = <Destination>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchDestinations();
    super.onInit();
  }

  void fetchDestinations() async {
    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 1));

    destinations.value = [
      Destination(name: 'Bali', location: 'Indonesia', rating: 4.8),
      Destination(name: 'Yogyakarta', location: 'Indonesia', rating: 4.7),
      Destination(name: 'Bandung', location: 'Indonesia', rating: 4.6),
    ];

    isLoading.value = false;
  }
}
