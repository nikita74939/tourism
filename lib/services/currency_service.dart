import '../models/currency_model.dart';
import 'api_service.dart';

class CurrencyService {
  final _api = ApiService();

  Future<List<CurrencyModel>> getAllCurrencies() async {
    final response = await _api.get('/currencies');
    final List data = response.data['data'];
    return data.map((e) => CurrencyModel.fromJson(e)).toList();
  }

  Future<CurrencyModel> getCurrencyByCode(String code) async {
    final response = await _api.get('/currencies/$code');
    return CurrencyModel.fromJson(response.data['data']);
  }

  Future<CurrencyConversion> convertCurrency({
    required String from,
    required String to,
    required double amount,
  }) async {
    final response = await _api.get(
      '/currencies/convert',
      queryParameters: {
        'from': from,
        'to': to,
        'amount': amount,
      },
    );
    return CurrencyConversion.fromJson(response.data);
  }
}
