import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/post.model.dart';

class ApiRepository {
  final Dio dio = Dio();
  static const baseURL = 'https://jsonplaceholder.typicode.com';
  static const postsEndpoint = baseURL + '/posts';

  Future<PostModel> fetchApi(int postId) async {
    try {
      final response = await dio.get(postsEndpoint + '/$postId');
      debugPrint(response.toString());
      return PostModel.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint('Status code: ${e.response?.statusCode.toString()}');
      throw Exception('Failed to load post: $postId');
    }
  }

  Future<List<PostModel>> fetchAllApis() async {
    try {
      final response = await dio.get(postsEndpoint);
      debugPrint(response.toString());
      return PostModel.listFromJson(response.data);
    } on DioError catch (e) {
      debugPrint('Status code: ${e.response?.statusCode.toString()}');
      throw Exception('Failed to load all posts');
    }
  }

  Future<dynamic> fetchPostApi(String title, String body, String userId) async {
    try {
      final response = await dio.post(
        postsEndpoint,
        data: {
          'title': title,
          'body': body,
          'userId': userId,
        },
      );
      debugPrint(response.data.toString());
      return response.data;
    } on DioError catch (e) {
      debugPrint('Status code: ${e.response?.statusCode}');
      throw Exception('Failed to load all posts');
    }
  }
}
