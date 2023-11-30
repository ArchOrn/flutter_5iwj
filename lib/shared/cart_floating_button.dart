import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_5iwj/cart/blocs/cart_bloc.dart';
import 'package:flutter_5iwj/cart/cart_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartFloatingButton extends StatelessWidget {
  const CartFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final count = state.items.isNotEmpty
            ? state.items.map((e) => e.quantity).reduce((a, b) => a + b)
            : 0;
        return Hero(
          tag: 'cart_floating_action_button',
          child: badges.Badge(
            badgeContent: Text(
              count.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: FloatingActionButton(
              heroTag: null,
              onPressed: () => CartScreen.navigateTo(context),
              child: const Icon(
                Icons.shopping_cart,
              ),
            ),
          ),
        );
      },
    );
  }
}
