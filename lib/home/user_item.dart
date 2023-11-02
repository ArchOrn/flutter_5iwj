import 'package:flutter/material.dart';
import 'package:flutter_5iwj/core/models/user.dart';

class UserItem extends StatelessWidget {
  final User user;

  const UserItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.fullName),
      subtitle: Text(user.address),
      leading: const Icon(
        Icons.person,
      ),
    );
  }
}
