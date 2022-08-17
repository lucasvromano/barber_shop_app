import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/api.model.dart';

class ApiRepository {
  final Dio dio = Dio();
  static const baseURL = 'https://jsonplaceholder.typicode.com';
  static const postsEndpoint = baseURL + '/posts';

  Future<ApiModel> fetchApi(int postId) async {
    try {
      final response = await dio.get(postsEndpoint + '/$postId');
      // debugPrint(response.toString());
      return ApiModel.fromJson(response.data);
    } on DioError catch (e) {
      // debugPrint('Status code: ${e.response?.statusCode.toString()}');
      throw Exception('Failed to load post: $postId');
    }
  }

  Future<List<ApiModel>> fetchAllApis() async {
    try {
      final response = await dio.get(postsEndpoint + '');
      // debugPrint(response.toString());
      return ApiModel.listFromJson(response.data);
      // return Api.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint('Status code: ${e.response?.statusCode.toString()}');
      throw Exception('Failed to load all posts');
    }
  }
}
