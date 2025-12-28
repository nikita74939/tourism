import '../models/user_model.dart';
import 'api_service.dart';

class AuthService {
  final _api = ApiService();

  Future<AuthResponse> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await _api.post(
      '/auth/register',
      data: {
        'name': name,
        'email': email,
        'password': password,
      },
    );

    return AuthResponse.fromJson(response.data);
  }

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    final response = await _api.post(
      '/auth/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    return AuthResponse.fromJson(response.data);
  }

  Future<UserModel> getProfile() async {
    final response = await _api.get('/auth/profile');

    return UserModel.fromJson(response.data['data']);
  }
}
