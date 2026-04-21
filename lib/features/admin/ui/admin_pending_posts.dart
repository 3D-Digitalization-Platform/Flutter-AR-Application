import 'package:flutter/material.dart';
import '../service/admin_service.dart';

class PendingPostsScreen extends StatelessWidget {
  final AdminService _adminService = AdminService();

  PendingPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Fetch posts using AdminService
    final posts = [
      {
        "id": "1",
        "company": "Cuong Duyen Ceramics",
        "logo": "assets/logos/company1.png",
        "image": "assets/posts/post1.png",
      },
      {
        "id": "2",
        "company": "IKEA",
        "logo": "assets/logos/company2.png",
        "image": "assets/posts/post2.png",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFE9EDF3),

      /// 🔹 AppBar
      appBar: AppBar(
        backgroundColor: const Color(0xFFE9EDF3),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Company Posts",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.menu, color: Colors.black),
          )
        ],
      ),

      /// 🔹 Body
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];

          return PostCard(
            companyName: post["company"]!,
            logo: post["logo"]!,
            image: post["image"]!,
            onApprove: () {
              _adminService.approvePost(post["id"]!);
            },
            onReject: () {
              _adminService.rejectPost(post["id"]!);
            },
          );
        },
      ),

      /// 🔹 Bottom Nav
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A8ECF), Color(0xFF8AA6D9)],
          ),
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
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
    );
  }
}

class PostCard extends StatelessWidget {
  final String companyName;
  final String logo;
  final String image;
  final VoidCallback onApprove;
  final VoidCallback onReject;

  const PostCard({
    super.key,
    required this.companyName,
    required this.logo,
    required this.image,
    required this.onApprove,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 Company Row
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(logo),
              ),
              const SizedBox(width: 10),
              Text(
                companyName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              )
            ],
          ),

          const SizedBox(height: 16),

          /// 🔹 Post Image
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 16),

          /// 🔹 Actions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _actionButton(
                text: "Approve",
                color: const Color(0xFF5E8FD6),
                onTap: onApprove,
              ),
              _actionButton(
                text: "Reject",
                color: Colors.red,
                onTap: onReject,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _actionButton({
    required String text,
    required Color color,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: 120,
      height: 45,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 4,
        ),
        child: Text(text),
      ),
    );
  }
}
