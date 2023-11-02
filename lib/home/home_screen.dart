import 'package:flutter/material.dart';
import 'package:flutter_5iwj/core/errors/network_error.dart';
import 'package:flutter_5iwj/core/models/post.dart';
import 'package:flutter_5iwj/core/services/api_services.dart';
import 'package:flutter_5iwj/home/post_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loading = true;
  Error? _error;
  List<Post> _posts = [];

  @override
  void initState() {
    super.initState();

    ApiServices.getPosts().then((posts) {
      setState(() {
        _posts = posts;
        _loading = false;
        _error = null;
      });
    }).catchError((error) {
      setState(() {
        _posts = [];
        _loading = false;
        _error = error;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Builder(builder: (context) {
          if (_loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (_error != null) {
            return Center(
              child: Text(
                _error is NetworkError ? 'Network error' : 'Error',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (_posts.isEmpty) {
            return const Center(
              child: Text('No posts available'),
            );
          }

          return ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: PostItem(post: _posts[index]),
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
            itemCount: _posts.length,
          );
        }),
      ),
    );
  }
}
