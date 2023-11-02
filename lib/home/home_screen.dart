import 'package:flutter/material.dart';
import 'package:flutter_5iwj/core/errors/network_error.dart';
import 'package:flutter_5iwj/core/services/api_services.dart';
import 'package:flutter_5iwj/home/user_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FutureBuilder(
            future: ApiServices.getUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    snapshot.error is NetworkError ? 'Network error' : 'Error',
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }

              if (!snapshot.hasData) {
                return const Center(
                  child: Text('No users available'),
                );
              }

              final users = snapshot.data!;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: UserItem(user: users[index]),
                  );
                },
                itemCount: users.length,
              );
            }),
      ),
    );
  }
}
