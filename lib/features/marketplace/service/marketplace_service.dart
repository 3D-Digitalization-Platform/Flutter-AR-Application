import '../model/product_model.dart';

// TODO: Implement MarketplaceService
class MarketplaceService {
  // TODO: Enable when JWT is implemented
  final bool useAuth = false;

  Future<List<ProductModel>> getProducts() async {
    // TODO: Implement getProducts logic
    // TODO: Attach JWT token to headers when useAuth = true
    return [
      ProductModel(
        id: "1",
        name: "Porcelain Vase",
        price: "1500 EGP",
        image: "assets/p2.jpg",
        rating: 4.6,
        reviews: 86,
      ),
      ProductModel(
        id: "2",
        name: "Modern Sofa",
        price: "8500 EGP",
        image: "assets/p1.jpg",
        rating: 4.8,
        reviews: 120,
      ),
    ];
  }

  Future<ProductModel?> getProductDetails(String id) async {
    // TODO: Implement getProductDetails logic
    // TODO: Attach JWT token to headers when useAuth = true
    return null;
  }
}
