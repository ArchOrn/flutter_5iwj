part of 'product_item_bloc.dart';

enum ProductItemStatus {
  initial,
  loading,
  success,
  error,
}

class ProductItemState {
  final ProductItemStatus status;
  final int? productId;
  final Product? product;
  final Error? error;
  final String? errorMessage;

  ProductItemState({
    this.status = ProductItemStatus.initial,
    this.productId,
    this.product,
    this.error,
    this.errorMessage,
  });

  ProductItemState copyWith({
    ProductItemStatus? status,
    int? productId,
    Product? product,
    Error? error,
    String? errorMessage,
  }) {
    return ProductItemState(
      status: status ?? this.status,
      productId: productId ?? this.productId,
      product: product ?? this.product,
      error: error ?? this.error,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
