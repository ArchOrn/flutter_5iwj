import 'package:flutter/material.dart';
import 'package:flutter_5iwj/cart/blocs/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  static void navigateTo(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const CartScreen();
    }));
    context.read<CartBloc>().add(CartItemsRetrieved());
  }

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: SafeArea(
        child: BlocConsumer<CartBloc, CartState>(
          listener: (context, state) {
            if (state.status == CartStatus.removed) {
              ScaffoldMessenger.of(context)
                ..clearSnackBars()
                ..showSnackBar(const SnackBar(
                  content: Text('Item has been successfully removed'),
                ));
            }
          },
          builder: (context, state) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final cartLine = state.items[index];
                return ListTile(
                  title: Text(cartLine.product.title),
                  subtitle: Text(cartLine.product.description),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 10),
                      Text(
                        cartLine.quantity.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () => context
                            .read<CartBloc>()
                            .add(CartItemRemoved(cartLine: cartLine)),
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
              itemCount: state.items.length,
            );
          },
        ),
      ),
    );
  }
}
