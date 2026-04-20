import 'package:dio/dio.dart';
import '../../main.dart';
import '../config/env_config.dart';
import '../storage/secure_storage_service.dart';

class AuthService {
  late final Dio _dio;
  final SecureStorageService _storageService = SecureStorageService();
  String? token;

  AuthService() {
    _dio = Dio(BaseOptions(
      baseUrl: EnvConfig.baseUrl,
      connectTimeout: const Duration(milliseconds: EnvConfig.connectTimeout),
      receiveTimeout: const Duration(milliseconds: EnvConfig.receiveTimeout),
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        if (token == null) {
          await loadToken();
        }
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          await logout();
          navigatorKey.currentState?.pushNamedAndRemoveUntil('/', (route) => false);
        }
        return handler.next(e);
      },
    ));
  }

  Future<void> loadToken() async {
    token = await _storageService.getToken();
  }

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
        token = response.data['token'];
        await _storageService.saveToken(token!);
      }
    } on DioException catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    token = null;
    await _storageService.deleteToken();
  }

  Future<String?> getToken() async {
    if (token == null) {
      await loadToken();
    }
    return token;
  }

  Future<void> refreshToken() async {
    // TODO: Implement refresh token logic if supported by backend
    // The current API doc doesn't provide a refresh token endpoint.
  }

  Dio get dio => _dio;
}
