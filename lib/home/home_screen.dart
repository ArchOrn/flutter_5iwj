import 'package:flutter/material.dart';
import 'package:flutter_5iwj/home/blocs/products_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsBloc()..add(ProductsDataLoaded()),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is ProductsLoadSuccess) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return ListTile(
                        title: Text(product.title),
                        subtitle: Text(product.description),
                      );
                    },
                    itemCount: state.products.length,
                  );
                }

                if (state is ProductsLoadError) {
                  return Container(
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        state.message,
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
      }),
    );
  }
}
