import '../model/profile_model.dart';

// TODO: Implement ProfileService
class ProfileService {
  // TODO: Enable when JWT is implemented
  final bool useAuth = false;

  Future<ProfileModel?> getProfile(String userId) async {
    // TODO: Implement getProfile logic
    // TODO: Attach JWT token to headers when useAuth = true
    return ProfileModel(
      id: userId,
      name: "bruce wayne",
      bio: "Billionaire Investor. Enjoying life in Gotham.",
      profileImage: "assets/profile.jpg",
      coverImage: "assets/cover.jpg",
      points: "100B",
      following: 0,
      gallery: [
        "assets/p1.jpg",
        "assets/p2.jpg",
        "assets/p3.jpg",
        "assets/p4.jpg",
        "assets/p5.jpg",
        "assets/p6.jpg",
      ],
    );
  }
}
