import 'package:flutter/material.dart';

class ComputationScreen extends StatelessWidget {
  static const routeName = 'computation';

  static navigateTo(BuildContext context, {required int number}) {
    Navigator.of(context).pushNamed(routeName, arguments: number);
  }

  final int number;

  const ComputationScreen({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Squared: ${number * number}'),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Go back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
