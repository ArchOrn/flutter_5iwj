import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_5iwj/core/exceptions/api_exception.dart';
import 'package:flutter_5iwj/core/models/product.dart';

class ApiServices {
  static ApiServices? _instance;

  static ApiServices get instance {
    if (_instance != null) _instance!;
    _instance = ApiServices._internal();
    return _instance!;
  }

  ApiServices._internal();

  Dio? _dio;

  Dio get _client {
    if (_dio != null) return _dio!;
    _dio = Dio(BaseOptions(
      baseUrl: 'https://dummyjson.com',
    ));
    return _dio!;
  }

  Future<List<Product>> getProducts() async {
    try {
      final response = await _client.get('/products');
      return response.data['products']?.map((e) {
            return Product.fromJson(e);
          }) ??
          [];
    } on DioException catch (exception) {
      log('Error while retrieving products', error: exception);
      throw ApiException(
        message: exception.message ?? 'Error while retrieving products',
      );
    }
  }
}
