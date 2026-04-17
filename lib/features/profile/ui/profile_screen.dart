import 'package:flutter/material.dart';
import '../model/profile_model.dart';
import '../service/profile_service.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileService _profileService = ProfileService();

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProfileModel?>(
      future: _profileService.getProfile("current_user"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        final profile = snapshot.data;
        if (profile == null) {
          return const Scaffold(body: Center(child: Text("Profile not found")));
        }

        return Scaffold(
          backgroundColor: const Color(0xFFEEF2F7),
          // 🔻 Bottom Nav
          bottomNavigationBar: Container(
            height: 70,
            decoration: const BoxDecoration(
              color: Color(0xFF6C8FCB),
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.home, color: Colors.white),
                Icon(Icons.shopping_cart, color: Colors.white),
                Icon(Icons.inbox, color: Colors.white),
                Icon(Icons.search, color: Colors.white),
                Icon(Icons.person, color: Colors.white),
              ],
            ),
          ),
          body: Stack(
            children: [
              // 🖼 Cover Image
              Container(
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: _getImageProvider(profile.coverImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SafeArea(
                child: Column(
                  children: [
                    // 🔝 Top Icons
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          _circleIcon(Icons.arrow_back),
                          const Spacer(),
                          _circleIcon(Icons.menu),
                        ],
                      ),
                    ),
                    const SizedBox(height: 120),
                    // 📦 Profile Card
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: const BoxDecoration(
                          color: Color(0xFFDCE3F0),
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          children: [
                            // 👤 Avatar
                            Transform.translate(
                              offset: const Offset(0, -60),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: _getImageProvider(profile.profileImage),
                              ),
                            ),
                            const SizedBox(height: 10),
                            // 📊 Stats
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _stat(profile.points, "Points"),
                                _stat(profile.following.toString(), "Following"),
                              ],
                            ),
                            const SizedBox(height: 10),
                            // 👤 Name
                            Text(
                              profile.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              profile.bio,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.black54),
                            ),
                            const SizedBox(height: 20),
                            // 🖼 Gallery
                            Expanded(
                              child: GridView.count(
                                crossAxisCount: 2,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 15,
                                children: profile.gallery
                                    .map((path) => _img(path))
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // 🔘 icon circle
  Widget _circleIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white70,
        shape: BoxShape.circle,
      ),
      child: Icon(icon),
    );
  }

  // 🖼 Image Provider Helper
  ImageProvider _getImageProvider(String path) {
    if (path.startsWith('http')) {
      return NetworkImage(path);
    } else {
      return AssetImage(path);
    }
  }

  // 📊 Stat Widget
  Widget _stat(String number, String title) {
    return Column(
      children: [
        Text(number,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(title, style: const TextStyle(color: Colors.black54)),
      ],
    );
  }

  // 🖼 Image Widget
  Widget _img(String path) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: path.startsWith('http')
          ? Image.network(path, fit: BoxFit.cover)
          : Image.asset(path, fit: BoxFit.cover),
    );
  }
}
