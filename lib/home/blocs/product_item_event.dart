part of 'product_item_bloc.dart';

sealed class ProductItemEvent {}

class ProductItemDataLoaded extends ProductItemEvent {
  final int id;

  ProductItemDataLoaded({required this.id});
}
