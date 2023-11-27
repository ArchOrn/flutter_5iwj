import 'dart:developer';

import 'package:flutter_5iwj/core/exceptions/api_exception.dart';
import 'package:flutter_5iwj/core/models/product.dart';
import 'package:flutter_5iwj/core/services/api_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<ProductsDataLoaded>((event, emit) async {
      emit(ProductsLoading());

      try {
        final products = await ApiServices.instance.getProducts();
        emit(ProductsLoadSuccess(products: products));
      } on ApiException catch (exception) {
        emit(ProductsLoadError(message: exception.message));
      } catch (exception) {
        log('Error while retrieving products', error: exception);
        emit(ProductsLoadError(message: 'Une erreur inconnue est survenue'));
      }
    });
  }
}
