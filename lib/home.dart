import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final count = 20;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView.separated(
          itemCount: count,
          itemBuilder: (context, index) {
            return Center(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  const RedSquare(),
                  Text(
                    index.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 30);
          },
        ),
      ),
    );
  }
}

class RedSquare extends StatelessWidget {
  const RedSquare({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      color: Colors.red,
    );
  }
}

class RedCircle extends StatelessWidget {
  const RedCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.red,
      ),
    );
  }
}
