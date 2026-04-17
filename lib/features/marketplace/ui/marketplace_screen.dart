import 'package:flutter/material.dart';
import '../service/marketplace_service.dart';
import '../model/product_model.dart';
import 'widgets/product_card.dart';

class MarketplaceScreen extends StatelessWidget {
  final MarketplaceService _marketplaceService = MarketplaceService();

  MarketplaceScreen({super.key});

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
              child: FutureBuilder<List<ProductModel>>(
                future: _marketplaceService.getProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Center(child: Text("Error loading products"));
                  }
                  final products = snapshot.data ?? [];
                  return GridView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCard(
                        name: product.name,
                        price: product.price,
                        image: product.image,
                        rating: product.rating,
                        reviews: product.reviews,
                        onTap: () {
                          // TODO: Navigate to details with product id
                        },
                      );
                    },
                  );
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
