import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  static navigateTo(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return const UsersScreen();
      }),
    );
  }

  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Go back'),
          ),
        ),
      ),
    );
  }
}
