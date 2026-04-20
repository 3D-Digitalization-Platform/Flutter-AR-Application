import '../../../core/auth/auth_service.dart';

class AdminService {
  final AuthService _authService = AuthService();
  String? token;

  AdminService() {
    _loadToken();
  }

  Future<void> _loadToken() async {
    token = await _authService.getToken();
  }

  Future<void> approvePost(String postId) async {
    // TODO: Implement approvePost logic using _authService.dio
  }

  Future<void> rejectPost(String postId) async {
    // TODO: Implement rejectPost logic using _authService.dio
  }

  Future<void> approveRequest(String requestId) async {
    // TODO: Implement approveRequest logic using _authService.dio
  }
}
