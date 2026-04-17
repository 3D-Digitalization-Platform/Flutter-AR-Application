import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/profile_model.dart';

// TODO: Implement ProfileService (switch to real backend later)
class ProfileService {
  // TODO: Enable when JWT is implemented
  final bool useAuth = false;

  Future<ProfileModel?> getProfile(String userId) async {
    try {
      // TODO: Replace with real backend endpoint when available
      final url = Uri.parse('https://dummyjson.com/users/$userId');

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',

          // TODO: Attach JWT token to headers when useAuth = true
          if (useAuth) 'Authorization': 'Bearer YOUR_TOKEN',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

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