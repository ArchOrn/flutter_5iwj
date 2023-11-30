import 'dart:convert';

import 'package:flinq/flinq.dart';
import 'package:flutter_5iwj/core/models/cart_line.dart';
import 'package:flutter_5iwj/core/models/product.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CartServices {
  static CartServices? _instance;

  static CartServices get instance {
    if (_instance != null) _instance!;
    _instance = CartServices._internal();
    return _instance!;
  }

  CartServices._internal();

  static const _cartKey = 'kCart';

  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(sharedPreferencesName: 'cart'),
    iOptions: IOSOptions(groupId: 'cart'),
  );

  Future<List<CartLine>> getItems() async {
    final data = await _storage.read(key: _cartKey);
    final items = data != null ? (jsonDecode(data) as List<dynamic>) : [];
    return items.map((e) => CartLine.fromJson(e)).toList();
  }

  Future<void> addItem({
    required Product product,
    int quantity = 1,
  }) async {
    final items = await getItems();
    final existing = items.firstOrNullWhere((e) => e.product.id == product.id);
    if (existing != null) {
      existing.quantity += quantity;
    } else {
      items.add(CartLine(product: product, quantity: quantity));
    }

    final json = items.map((e) => e.toJson()).toList();
    _storage.write(key: _cartKey, value: jsonEncode(json));
  }

  Future<void> removeItem({
    required CartLine cartLine,
  }) async {
    final items = await getItems();
    final json = items
        .where((e) => e.product.id != cartLine.product.id)
        .map((e) => e.toJson())
        .toList();
    _storage.write(key: _cartKey, value: jsonEncode(json));
  }
}
