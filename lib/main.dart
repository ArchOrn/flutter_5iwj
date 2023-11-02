import 'package:flutter/material.dart';
import 'package:flutter_5iwj/computation/computation_screen.dart';
import 'package:flutter_5iwj/home/home_screen.dart';
import 'package:flutter_5iwj/users/users_screen.dart';

void main() async {
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
      routes: {
        '/': (_) => const HomeScreen(),
        UsersScreen.routeName: (_) => const UsersScreen(),
      },
      onGenerateRoute: (RouteSettings settings) {
        switch(settings.name) {
          case ComputationScreen.routeName:
            return MaterialPageRoute(builder: (_) {
              final number = settings.arguments as int;
              return ComputationScreen(number: number);
            });
        }

        return null;
      },
    );
  }
}
