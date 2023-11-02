import 'package:flutter/material.dart';
import 'package:flutter_5iwj/users/users_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              UsersScreen.navigateTo(context);
            },
            child: const Text('Click me!'),
          ),
        ),
      ),
    );
  }
}
