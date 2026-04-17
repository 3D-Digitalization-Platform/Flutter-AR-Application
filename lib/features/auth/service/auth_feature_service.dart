import '../model/user_model.dart';

// TODO: Implement AuthFeatureService
class AuthFeatureService {
  // TODO: Enable when JWT is implemented
  final bool useAuth = false;

  Future<UserModel?> login(String email, String password) async {
    // TODO: Implement login logic
    // TODO: Attach JWT token to headers when useAuth = true
    return null;
  }

  Future<bool> signup(String email, String password, String name) async {
    // TODO: Implement signup logic
    // TODO: Attach JWT token to headers when useAuth = true
    return true;
  }

  Future<void> logout() async {
    // TODO: Implement logout logic
  }
}
