import 'package:flutter/material.dart';
import '../../home/ui/widgets/post_card.dart';
import '../service/admin_service.dart';

class AdminHomeScreen extends StatelessWidget {
  final AdminService _adminService = AdminService();

  AdminHomeScreen({super.key});

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
            Icon(Icons.shield, color: Colors.white),
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
                    comments: "20",
                  ),
                  PostCard(
                    title: "IKEA",
                    image: "assets/sofa.png",
                    likes: "320",
                    comments: "15",
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
