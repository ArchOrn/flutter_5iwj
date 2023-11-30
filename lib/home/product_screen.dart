import 'package:flutter/material.dart';
import 'package:flutter_5iwj/cart/blocs/cart_bloc.dart';
import 'package:flutter_5iwj/home/blocs/product_item_bloc.dart';
import 'package:flutter_5iwj/shared/cart_floating_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  static void navigateTo(BuildContext context, {required int id}) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ProductScreen(id: id);
    }));
  }

  final int id;

  const ProductScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductItemBloc()..add(ProductItemDataLoaded(id: id)),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              child: BlocBuilder<ProductItemBloc, ProductItemState>(
                builder: (context, state) {
                  if (state.status == ProductItemStatus.success) {
                    final product = state.product!;
                    return Column(
                      children: [
                        if (product.imageUrl != null) Image.network(product.imageUrl!),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(
                                product.title,
                                style: const TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                product.description,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 10),
                              BlocConsumer<CartBloc, CartState>(
                                listener: (context, state) {
                                  if (state.status == CartStatus.added) {
                                    ScaffoldMessenger.of(context)
                                      ..clearSnackBars()
                                      ..showSnackBar(const SnackBar(
                                        content: Text('Item has been successfully added'),
                                      ));
                                  }
                                },
                                builder: (context, state) {
                                  return ElevatedButton(
                                    onPressed: () => context.read<CartBloc>().add(
                                          CartItemAdded(
                                            product: product,
                                            quantity: 1,
                                          ),
                                        ),
                                    child: state.status == CartStatus.loading
                                        ? const Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CircularProgressIndicator(),
                                            ],
                                          )
                                        : const Text('Add item to cart'),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  }

                  if (state.status == ProductItemStatus.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state.status == ProductItemStatus.error) {
                    return Container(
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          state.errorMessage ?? 'Une erreur est survenue',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
            floatingActionButton: const CartFloatingButton(),
          );
        },
      ),
    );
  }
}
