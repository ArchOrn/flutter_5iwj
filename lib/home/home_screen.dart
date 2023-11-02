import 'package:flutter/material.dart';
import 'package:flutter_5iwj/core/errors/network_error.dart';
import 'package:flutter_5iwj/core/services/api_services.dart';
import 'package:flutter_5iwj/home/post_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FutureBuilder(
            future: ApiServices.getPosts(),
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
                  child: Text('No posts available'),
                );
              }

              final posts = snapshot.data!;
              return ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: PostItem(post: posts[index]),
                  );
                },
                separatorBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(height: 5),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.blue,
                      ),
                      const SizedBox(height: 5),
                    ],
                  );
                },
                itemCount: posts.length,
              );
            }),
      ),
    );
  }
}
