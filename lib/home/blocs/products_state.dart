part of 'products_bloc.dart';

sealed class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoadSuccess extends ProductsState {
  final List<Product> products;

  ProductsLoadSuccess({required this.products});
}

class ProductsLoadError extends ProductsState {
  final String message;

  ProductsLoadError({required this.message});
}