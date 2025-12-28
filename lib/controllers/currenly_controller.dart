import 'package:get/get.dart';
import '../models/currency_model.dart';
import '../services/currency_service.dart';

class CurrencyController extends GetxController {
  final _currencyService = CurrencyService();

  final currencies = <CurrencyModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getCurrencies();
  }

  Future<void> getCurrencies() async {
    try {
      isLoading.value = true;
      currencies.value = await _currencyService.getAllCurrencies();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<CurrencyConversion?> convert({
    required String from,
    required String to,
    required double amount,
  }) async {
    try {
      return await _currencyService.convertCurrency(
        from: from,
        to: to,
        amount: amount,
      );
    } catch (e) {
      Get.snackbar('Error', e.toString());
      return null;
    }
  }
}
