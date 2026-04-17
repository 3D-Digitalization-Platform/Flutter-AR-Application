import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F7),

      // 🔻 Bottom Nav
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Color(0xFF6C8FCB),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.home, color: Colors.white),
            Icon(Icons.shopping_cart, color: Colors.white),
            Icon(Icons.inbox, color: Colors.white),
            Icon(Icons.search, color: Colors.white),
            Icon(Icons.person, color: Colors.white),
          ],
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),

            // 🔝 Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _circleIcon(Icons.favorite, Colors.red.shade100),
                  const Spacer(),
                  const Text(
                    "Explore",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  _circleIcon(Icons.menu, Colors.grey.shade200),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // 📜 Posts
            Expanded(
              child: ListView(
                children: const [
                  PostCard(
                    title: "Cuong Duyen Ceramics",
                    image: "assets/vase.png",
                    likes: "453",
                  ),
                  PostCard(
                    title: "IKEA",
                    image: "assets/sofa.png",
                    likes: "320",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔘 circle icon
  Widget _circleIcon(IconData icon, Color bg) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bg,
        shape: BoxShape.circle,
      ),
      child: Icon(icon),
    );
  }
}

// 🧱 Post Card
class PostCard extends StatelessWidget {
  final String title;
  final String image;
  final String likes;

  const PostCard({
    super.key,
    required this.title,
    required this.image,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFDCE3F0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // 🔝 Header
          Row(
            children: [
              const CircleAvatar(radius: 16),
              const SizedBox(width: 8),
              Text(title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(70, 30),
                ),
                child: const Text("Follow"),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // 🖼 Image
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 10),

          // ❤️ actions
          Row(
            children: [
              const Icon(Icons.chat_bubble_outline, size: 18),
              const SizedBox(width: 5),
              const Text("20"),
              const SizedBox(width: 15),
              const Icon(Icons.favorite_border, size: 18),
              const SizedBox(width: 5),
              Text(likes),
              const Spacer(),
              const Icon(Icons.send),
              const SizedBox(width: 10),
              const Icon(Icons.bookmark_border),
            ],
          )
        ],
      ),
    );
  }
}