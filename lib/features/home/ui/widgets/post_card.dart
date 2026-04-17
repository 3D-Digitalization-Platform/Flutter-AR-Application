import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String title;
  final String image;
  final String likes;
  final String comments;

  const PostCard({
    super.key,
    required this.title,
    required this.image,
    required this.likes,
    required this.comments,
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
              Text(comments),
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
