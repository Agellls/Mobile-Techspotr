import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as get_package;
import 'package:get_storage/get_storage.dart';

class ApiServices {
  final Dio dio = Dio();
  final box = GetStorage();
  // final authCon = get_package.Get.find<AuthController>();
  final String baseUrl = 'http://192.168.1.77/techspotr/api';

  Future<List<Map<String, dynamic>>> fetchPopularPosts(
      {int page = 1, int? categoryId}) async {
    try {
      // Build URL with optional category_id parameter
      String url = '$baseUrl/post?sort_by=popular&limit=6&page=$page';
      if (categoryId != null && categoryId > 0) {
        url += '&category_id=$categoryId';
      }

      final response = await dio.request(
        url,
        options: Options(
          method: 'GET',
        ),
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));

        // Parse the response data
        final data = response.data;
        if (data['status'] == true && data['data'] != null) {
          final results = data['data']['results'];
          if (results != null && results is List) {
            return List<Map<String, dynamic>>.from(results);
          }
        }
        return [];
      } else {
        throw Exception('Failed to fetch posts: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Error fetching posts: $e');
    }
  }

  Future<List<Map<String, dynamic>>> fetchCategories() async {
    try {
      final response = await dio.request(
        '$baseUrl/category',
        options: Options(
          method: 'GET',
        ),
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));

        final data = response.data;
        if (data['status'] == true && data['data'] != null) {
          return List<Map<String, dynamic>>.from(data['data']);
        }
        return [];
      } else {
        throw Exception(
            'Failed to fetch categories: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Error fetching categories: $e');
    }
  }

  Future<Map<String, dynamic>> fetchSinglePost(String postId) async {
    try {
      final headers = {
        'Cookie': 'tr_session=eyJpdiI6IjM2dk5tYjg0aXROU1RPYXNzSGNhL0E9PSIsInZhbHVlIjoiRldHb29LRlZ4ZEFCZ0NYUVhnbzhwQjB1TUFCRWNaeElXL2xYZnI2c1phdVBiUHlrd0tONko4UXY2VVpKcFlTWSIsIm1hYyI6IjQ4ZjA0MDZmNmY3ZDM2NGZkOTU5Zjk2NmU5ZGRlYTNiN2E5NTlkOGRhZmFjMzJhYzJmZDI1ZjhmNjg2MDMzYTcifQ%3D%3D'
      };

      final response = await dio.request(
        '$baseUrl/post/$postId',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        print('Single Post Response: ${json.encode(response.data)}');

        final data = response.data;
        if (data['status'] == true && data['data'] != null) {
          return data['data'];
        }
        throw Exception('Invalid response format');
      } else {
        throw Exception('Failed to fetch single post: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Error fetching single post: $e');
    }
  }

  Future<Map<String, dynamic>> fetchProductHighlights(String postId) async {
    try {
      final headers = {
        'Cookie': 'tr_session=eyJpdiI6ImNIYTBXejZsYVNnek1WT3RQK3d4OXc9PSIsInZhbHVlIjoiWVNNNjZteUJhaGZpaVpvSUlkaEN5Q2o2aS9sS2l4OG0xMmRNV1lTTnd3NC9RY0EzeCtRR0lucUFsZGJ3eXZEZSIsIm1hYyI6IjQyYmNlNjdjOTIwOGRiNjYwZjhlOGEyMWM2NjJmZWUwMDJiZGYzNjAwN2U3ODJhN2Q4MDViZTEyYTZiMjIxMGYifQ%3D%3D'
      };

      final response = await dio.request(
        '$baseUrl/post/$postId/highlight',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        print('Highlights Response: ${json.encode(response.data)}');

        final data = response.data;
        if (data['status'] == true && data['data'] != null) {
          return data['data'];
        }
        throw Exception('Invalid highlights response format');
      } else {
        throw Exception('Failed to fetch product highlights: ${response.statusMessage}');
      }
    } catch (e) {
      print('Highlights Error: $e');
      // Don't throw error here, just return empty data so basic product info still shows
      return {};
    }
  }
}
