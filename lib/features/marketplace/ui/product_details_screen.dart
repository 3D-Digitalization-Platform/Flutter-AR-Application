import 'package:flutter/material.dart';
import '../../../core/utils/image_utils.dart';
import '../model/product_model.dart';
import '../service/marketplace_service.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productId;
  final MarketplaceService _marketplaceService = MarketplaceService();

  ProductDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductModel?>(
      future: _marketplaceService.getProductDetails(productId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        
        // Using placeholder data since getProductDetails returns null for now
        final product = snapshot.data ?? ProductModel(
          id: productId,
          name: "Porcelain Vase",
          price: "1500 EGP",
          image: "assets/vase.png",
          rating: 4.6,
          reviews: 86,
          description: "This vase features a graceful, tapered shape with elegant design suitable for decoration.",
        );

        return Scaffold(
          backgroundColor: const Color(0xFFF2F4F7),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // 🛒 Buy Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6C8FCB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text("Buy", style: TextStyle(fontSize: 18)),
                  ),
                ),
                const SizedBox(width: 10),
                // 📷 AR Button
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: const Icon(Icons.qr_code_scanner),
                )
              ],
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🔝 Header
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Spacer(),
                        const Text("Detail Product",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const Spacer(),
                        const Icon(Icons.menu),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // 🖼 Product Image
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: ImageUtils.buildImage(product.image, height: 200)),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 🏷 Name
                        Text(
                          product.name,
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6),
                        // 💰 Price
                        Text(
                          product.price,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 6),
                        // ⭐ Rating
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.orange, size: 18),
                            const SizedBox(width: 4),
                            Text(product.rating.toString()),
                            const SizedBox(width: 6),
                            Text("${product.reviews} Reviews"),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Divider(),
                        const SizedBox(height: 10),
                        // 🏪 Store
                        Row(
                          children: const [
                            CircleAvatar(radius: 16),
                            SizedBox(width: 8),
                            Text("Cuong Duyen Ceramics"),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios, size: 16),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Divider(),
                        const SizedBox(height: 16),
                        // 📄 Description
                        const Text(
                          "Description Product",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          product.description,
                          style: const TextStyle(color: Colors.black54),
                        ),
                        const SizedBox(height: 20),
                        const Divider(),
                        const SizedBox(height: 10),
                        // ⭐ Review
                        Row(
                          children: [
                            Text("Review (${product.reviews})",
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                            const Spacer(),
                            const Icon(Icons.star, color: Colors.orange, size: 18),
                            Text(product.rating.toString()),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: const [
                            CircleAvatar(radius: 16),
                            SizedBox(width: 8),
                            Text("bruce wayne"),
                            Spacer(),
                            Text("1 month ago",
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                          style: TextStyle(color: Colors.black54),
                        ),
                        const SizedBox(height: 20),
                        // 🔘 Button
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text("See All Review"),
                        ),
                        const SizedBox(height: 20),
                        // 🔥 Featured
                        Row(
                          children: const [
                            Text("Featured Product",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Spacer(),
                            Text("See All",
                                style: TextStyle(color: Colors.blue)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(child: _card("Ceramic burner")),
                            const SizedBox(width: 10),
                            Expanded(child: _card("Golden Rooster Vase")),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // 🧱 Featured Card
  Widget _card(String title) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(height: 10),
          Text(title),
          const Text("1500 EGP", style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }
}
