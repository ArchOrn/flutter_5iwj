part of 'cart_bloc.dart';

sealed class CartEvent {}

class CartItemsRetrieved extends CartEvent {}

class CartItemAdded extends CartEvent {
  final Product product;
  final int quantity;

  CartItemAdded({required this.product, required this.quantity});
}

class CartItemRemoved extends CartEvent {
  final CartLine cartLine;

  CartItemRemoved({required this.cartLine});
}

class CartRemoved extends CartEvent {}
