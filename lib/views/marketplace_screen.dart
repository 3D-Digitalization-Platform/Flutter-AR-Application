import 'package:flutter/material.dart';

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});

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

      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),

            // 🔝 Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _circleIcon(Icons.tune),
                  const Spacer(),
                  const Text(
                    "Marketplace",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  _circleIcon(Icons.menu),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // 🧱 Grid Products
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: 6,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return const ProductCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔘 circle icon
  Widget _circleIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color(0xFFE3E8F0),
        shape: BoxShape.circle,
      ),
      child: Icon(icon),
    );
  }
}

// 🧱 Product Card
class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🖼 Image
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.shade200,
            ),
            child: Center(
              child: Image.asset("assets/p2.jpg", fit: BoxFit.cover),
            ),
          ),

          const SizedBox(height: 10),

          // 🏷 Name
          const Text(
            "Porcelain Vase",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 4),

          // 💰 Price
          const Text(
            "1500 EGP",
            style: TextStyle(color: Colors.blue),
          ),

          const SizedBox(height: 4),

          // ⭐ Rating
          Row(
            children: const [
              Icon(Icons.star, size: 16, color: Colors.orange),
              SizedBox(width: 4),
              Text("4.6"),
              SizedBox(width: 4),
              Text("86 Reviews"),
              Spacer(),
              Icon(Icons.more_vert, size: 18),
            ],
          ),
        ],
      ),
    );
  }
}