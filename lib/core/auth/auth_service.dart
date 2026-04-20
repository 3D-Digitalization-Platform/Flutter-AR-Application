import 'package:dio/dio.dart';
import '../config/env_config.dart';
import '../storage/secure_storage_service.dart';

class AuthService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: EnvConfig.baseUrl,
    connectTimeout: const Duration(milliseconds: EnvConfig.connectTimeout),
    receiveTimeout: const Duration(milliseconds: EnvConfig.receiveTimeout),
  ));

  final SecureStorageService _storageService = SecureStorageService();

  Future<Response> signup({
    required String firstName,
    required String lastName,
    required DateTime dateOfBirth,
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/api/Auth/signup',
        data: {
          'firstName': firstName,
          'lastName': lastName,
          'dateOfBirth': dateOfBirth.toIso8601String(),
          'phoneNumber': phoneNumber,
          'email': email,
          'password': password,
        },
      );
      return response;
    } on DioException catch (e) {
      rethrow;
    }
  }

  Future<void> login({
    required String email,
    required String password,
    bool rememberMe = false,
  }) async {
    try {
      final response = await _dio.post(
        '/api/Auth/login',
        data: {
          'email': email,
          'password': password,
          'rememberMe': rememberMe,
        },
      );

      if (response.statusCode == 200) {
        final token = response.data['token'];
        await _storageService.saveToken(token);
      }
    } on DioException catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    await _storageService.deleteToken();
  }

  Future<String?> getToken() async {
    return await _storageService.getToken();
  }

  Future<void> refreshToken() async {
    // TODO: Implement refresh token logic if supported by backend
    // The current API doc doesn't provide a refresh token endpoint.
  }
}
