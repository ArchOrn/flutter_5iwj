class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String? imageUrl;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: double.parse(json['price'].toString()),
      imageUrl: (json['images'] as List<dynamic>?)?.first,
    );
  }
}
