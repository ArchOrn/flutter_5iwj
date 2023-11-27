import 'package:flutter/material.dart';
import 'package:flutter_5iwj/home/blocs/product_item_bloc.dart';
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
      create: (context) =>
          ProductItemBloc()..add(ProductItemDataLoaded(id: id)),
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
                        if (product.imageUrl != null)
                          Image.network(product.imageUrl!),
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
          );
        },
      ),
    );
  }
}
