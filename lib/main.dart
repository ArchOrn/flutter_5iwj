import 'package:flutter/material.dart';
import 'package:flutter_5iwj/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const Home(),
    );
  }
}
