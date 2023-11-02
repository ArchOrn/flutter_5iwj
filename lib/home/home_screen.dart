import 'package:flutter/material.dart';
import 'package:flutter_5iwj/computation/computation_screen.dart';
import 'package:flutter_5iwj/users/users_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  UsersScreen.navigateTo(context);
                },
                child: const Text('Click me!'),
              ),
              ElevatedButton(
                onPressed: () {
                  ComputationScreen.navigateTo(context, number: 4);
                },
                child: const Text('Compute 4'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
