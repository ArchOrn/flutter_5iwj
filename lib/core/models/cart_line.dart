import 'package:flutter_5iwj/core/models/product.dart';

class CartLine {
  final Product product;
  int quantity;

  CartLine({
    required this.product,
    required this.quantity,
  });

  double get totalPrice => product.price * quantity;

  factory CartLine.fromJson(Map<String, dynamic> json) {
    return CartLine(
      product: Product.fromJson(json['product']),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'quantity': quantity,
    };
  }
}
