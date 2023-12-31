import 'package:flutter/material.dart';
import 'package:flutter_5iwj/cart/blocs/cart_bloc.dart';
import 'package:flutter_5iwj/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc()..add(CartItemsRetrieved()),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              color: Colors.amber,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        routes: {
          '/': (_) => const HomeScreen(),
        },
      ),
    );
  }
}
