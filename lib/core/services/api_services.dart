import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_5iwj/core/errors/network_error.dart';
import 'package:flutter_5iwj/core/errors/parsing_error.dart';
import 'package:flutter_5iwj/core/errors/unknown_error.dart';
import 'package:flutter_5iwj/core/models/post.dart';
import 'package:flutter_5iwj/core/models/user.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const _baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<List<Post>> getPosts() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/posts'));
      if (response.statusCode != 200) {
        throw Error();
      }

      final jsonBody = json.decode(response.body);
      final posts = (jsonBody as List<dynamic>?)?.map((json) {
        return Post.fromJson(json);
      }).toList();
      if (posts == null) {
        throw ParsingError();
      }

      await Future.delayed(const Duration(milliseconds: 500));

      return posts;
    } on SocketException {
      throw NetworkError();
    } catch (error) {
      log('error: $error', name: 'ApiServices');
      throw UnknownError(message: error.toString());
    }
  }

  static Future<List<User>> getUsers() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/users'));
      if (response.statusCode != 200) {
        throw Error();
      }

      final jsonBody = json.decode(response.body);
      final posts = (jsonBody as List<dynamic>?)?.map((json) {
        return User.fromJson(json);
      }).toList();
      if (posts == null) {
        throw ParsingError();
      }

      await Future.delayed(const Duration(milliseconds: 500));

      return posts;
    } on SocketException {
      throw NetworkError();
    } catch (error) {
      log('error: $error', name: 'ApiServices');
      throw UnknownError(message: error.toString());
    }
  }
}
