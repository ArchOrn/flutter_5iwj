import 'package:flutter/material.dart';
import 'package:flutter_5iwj/user.dart';

class UserItem extends StatelessWidget {
  final User user;

  const UserItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        print(user.firstName);
      },
      leading: Icon(Icons.person),
      title: Text('${user.firstName} ${user.lastName}'),
      subtitle: Text(user.address),
    );
  }
}
