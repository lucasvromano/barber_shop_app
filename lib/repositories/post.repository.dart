import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/post.model.dart';

class PostRepository {
  final Dio dio = Dio();
  static const baseURL = 'https://jsonplaceholder.typicode.com';
  static const postsEndpoint = baseURL + '/posts';

  Future<Post> fetchPost(int postId) async {
    try {
      final response = await dio.get(postsEndpoint + '/$postId');
      debugPrint(response.toString());
      return Post.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint('Status code: ${e.response?.statusCode.toString()}');
      throw Exception('Failed to load post: $postId');
    }
  }

  Future<List<Post>> fetchAllPosts() async {
    try {
      final response = await dio.get(postsEndpoint + '');
      debugPrint(response.toString());
      return Post.listFromJson(response.data);
      // return Post.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint('Status code: ${e.response?.statusCode.toString()}');
      throw Exception('Failed to load all posts');
    }
  }
}
