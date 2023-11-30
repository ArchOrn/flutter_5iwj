import 'package:flutter_5iwj/core/models/cart_line.dart';
import 'package:flutter_5iwj/core/models/product.dart';
import 'package:flutter_5iwj/core/services/cart_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<CartItemsRetrieved>((event, emit) async {
      emit(state.copyWith(status: CartStatus.loading));
      final items = await CartServices.instance.getItems();
      emit(state.copyWith(status: CartStatus.success, items: items));
    });

    on<CartItemAdded>((event, emit) async {
      emit(state.copyWith(status: CartStatus.loading));
      await CartServices.instance.addItem(
        product: event.product,
        quantity: event.quantity,
      );
      emit(state.copyWith(status: CartStatus.added));
      add(CartItemsRetrieved());
    });

    on<CartItemRemoved>((event, emit) async {
      emit(state.copyWith(status: CartStatus.loading));
      await CartServices.instance.removeItem(
        cartLine: event.cartLine,
      );
      emit(state.copyWith(status: CartStatus.removed));
      add(CartItemsRetrieved());
    });

    on<CartRemoved>((event, emit) async {
      // TODO
    });
  }
}
