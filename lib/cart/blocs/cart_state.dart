part of 'cart_bloc.dart';

enum CartStatus {
  initial,
  loading,
  success,
  added,
  removed,
  error,
}

class CartState {
  final CartStatus status;
  final List<CartLine> items;
  final Error? error;
  final String? errorMessage;

  CartState({
    this.status = CartStatus.initial,
    this.items = const [],
    this.error,
    this.errorMessage,
  });

  CartState copyWith({
    CartStatus? status,
    List<CartLine>? items,
    Error? error,
    String? errorMessage,
  }) {
    return CartState(
      status: status ?? this.status,
      items: items ?? this.items,
      error: error ?? this.error,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
