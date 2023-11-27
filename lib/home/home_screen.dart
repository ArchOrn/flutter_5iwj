import 'package:flutter/material.dart';
import 'package:flutter_5iwj/home/blocs/products_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              const Center(
                child: CircularProgressIndicator(),
              );
            }

            // TODO

            return Container();
          },
        ),
      ),
    );
  }
}
