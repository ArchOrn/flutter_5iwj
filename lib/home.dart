import 'package:flutter/material.dart';
import 'package:flutter_5iwj/user.dart';
import 'package:flutter_5iwj/user_item.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final users = List.generate(100, (index) {
      return User(
        firstName: 'First name $index',
        lastName: 'Last name $index',
        address: '$index, rue du Faubourg St Antoine',
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return UserItem(user: users[index]);
          },
        ),
      ),
    );
  }
}
