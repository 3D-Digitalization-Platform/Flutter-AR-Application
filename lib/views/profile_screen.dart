import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/cover.jpg"),
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
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage("assets/profile.jpg"),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // 📊 Stats
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                          children: const [
                            _stat("100B", "Points"),
                            _stat("0", "Following"),
                          ],
                        ),

                        const SizedBox(height: 10),

                        // 👤 Name
                        const Text(
                          "bruce wayne",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 6),

                        const Text(
                          "Billionaire Investor. Enjoying life in Gotham.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black54),
                        ),

                        const SizedBox(height: 20),

                        // 🖼 Gallery
                        Expanded(
                          child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            children: const [
                              _img("assets/p1.jpg"),
                              _img("assets/p2.jpg"),
                              _img("assets/p3.jpg"),
                              _img("assets/p4.jpg"),
                              _img("assets/p5.jpg"),
                              _img("assets/p6.jpg"),
                            ],
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
}

// 📊 Stat Widget
class _stat extends StatelessWidget {
  final String number;
  final String title;

  const _stat(this.number, this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(number,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16)),
        Text(title, style: const TextStyle(color: Colors.black54)),
      ],
    );
  }
}

// 🖼 Image Widget
class _img extends StatelessWidget {
  final String path;

  const _img(this.path);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(path, fit: BoxFit.cover),
    );
  }
}