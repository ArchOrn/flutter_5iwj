import 'dart:developer';

import 'package:flutter_5iwj/core/exceptions/api_exception.dart';
import 'package:flutter_5iwj/core/models/product.dart';
import 'package:flutter_5iwj/core/services/api_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_item_event.dart';
part 'product_item_state.dart';

class ProductItemBloc extends Bloc<ProductItemEvent, ProductItemState> {
  ProductItemBloc() : super(ProductItemState()) {
    on<ProductItemDataLoaded>((event, emit) async {
      emit(ProductItemState(
        status: ProductItemStatus.loading,
        productId: event.id,
      ));

      try {
        final product = await ApiServices.instance.getProduct(id: event.id);
        emit(state.copyWith(
          status: ProductItemStatus.success,
          product: product,
        ));
      } on ApiException catch (exception) {
        emit(state.copyWith(
          status: ProductItemStatus.error,
          error: exception,
          errorMessage: exception.message,
        ));
      } catch (exception) {
        log('Error while retrieving products', error: exception);
        emit(state.copyWith(
          status: ProductItemStatus.error,
          errorMessage: 'Une erreur inconnue est survenue',
        ));
      }
    });
  }
}
