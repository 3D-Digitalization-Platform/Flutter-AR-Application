class ProductModel {
  final String id;
  final String name;
  final String price;
  final String image;
  final double rating;
  final int reviews;
  final String description;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.rating,
    required this.reviews,
    this.description = "",
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      image: json['image'],
      rating: json['rating'].toDouble(),
      reviews: json['reviews'],
      description: json['description'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'rating': rating,
      'reviews': reviews,
      'description': description,
    };
  }
}
