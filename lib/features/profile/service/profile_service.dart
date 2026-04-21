import 'package:dio/dio.dart';
import '../../../core/auth/auth_service.dart';
import '../model/profile_model.dart';

class ProfileService {
  final AuthService _authService = AuthService();
  String? token;

  ProfileService() {
    _loadToken();
  }

  Future<void> _loadToken() async {
    token = await _authService.getToken();
  }

  Future<ProfileModel?> getProfile(String userId) async {
    try {
      final response = await _authService.dio.get('/users/$userId');

      if (response.statusCode == 200) {
        final data = response.data;

        // TODO: Map API response properly when backend schema is finalized
        return ProfileModel(
          id: data['id'].toString(),
          name: "${data['firstName']} ${data['lastName']}",
          bio: "Works at ${data['company']?['name'] ?? 'Unknown Company'}",
          profileImage: data['image'] ?? "assets/profile.jpg",

          // TODO: Replace with real cover image from backend
          coverImage: "assets/cover.jpg",

          // TODO: Replace with real points system
          points: "${data['age']} pts",

          // TODO: Replace with real following count
          following: 0,

          // TODO: Replace with real gallery endpoint
          gallery: [
            data['image'],
            "https://i.pravatar.cc/300?img=1",
            "https://i.pravatar.cc/300?img=2",
            "https://i.pravatar.cc/300?img=3",
            "https://i.pravatar.cc/300?img=4",
          ],
        );
      } else {
        // TODO: Add proper error handling / logger
        print("Failed to load profile: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      // TODO: Replace with structured logging system
      print("Error fetching profile: $e");
      return null;
    }
  }
}