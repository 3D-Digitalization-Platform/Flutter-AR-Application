import '../../../core/auth/auth_service.dart';
import '../model/user_model.dart';

class AuthFeatureService {
  final AuthService _authService = AuthService();

  Future<UserModel?> login(String email, String password, {bool rememberMe = false}) async {
    try {
      await _authService.login(email: email, password: password, rememberMe: rememberMe);
      // For now, returning a dummy UserModel as the API only returns a token.
      // In a real app, you might fetch user details using the token.
      return UserModel(id: '1', email: email, name: 'User');
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> signup({
    required String firstName,
    required String lastName,
    required DateTime dateOfBirth,
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    try {
      await _authService.signup(
        firstName: firstName,
        lastName: lastName,
        dateOfBirth: dateOfBirth,
        phoneNumber: phoneNumber,
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    await _authService.logout();
  }

  Future<String?> getToken() async {
    return await _authService.getToken();
  }
}
