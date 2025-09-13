import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  
  // Fetch all posts
  static Future<List<Post>> fetchPosts() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/posts'),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 10));

      return _handleResponse<List<Post>>(response, (data) {
        final List<dynamic> jsonData = data;
        return jsonData.map((json) => Post.fromJson(json)).toList();
      });
    } catch (e) {
      throw _handleError(e);
    }
  }

  // Fetch single post by ID
  static Future<Post> fetchPost(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/posts/$id'),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 10));

      return _handleResponse<Post>(response, (data) {
        return Post.fromJson(data);
      });
    } catch (e) {
      throw _handleError(e);
    }
  }

  // Create new post
  static Future<Post> createPost(Post post) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/posts'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(post.toJson()),
      ).timeout(const Duration(seconds: 10));

      return _handleResponse<Post>(response, (data) {
        return Post.fromJson(data);
      });
    } catch (e) {
      throw _handleError(e);
    }
  }

  // Update existing post
  static Future<Post> updatePost(int id, Post post) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/posts/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(post.toJson()),
      ).timeout(const Duration(seconds: 10));

      return _handleResponse<Post>(response, (data) {
        return Post.fromJson(data);
      });
    } catch (e) {
      throw _handleError(e);
    }
  }

  // Partially update post
  static Future<Post> patchPost(int id, Map<String, dynamic> updates) async {
    try {
      final response = await http.patch(
        Uri.parse('$baseUrl/posts/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(updates),
      ).timeout(const Duration(seconds: 10));

      return _handleResponse<Post>(response, (data) {
        return Post.fromJson(data);
      });
    } catch (e) {
      throw _handleError(e);
    }
  }

  // Delete post
  static Future<bool> deletePost(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/posts/$id'),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 10));

      return _handleResponse<bool>(response, (data) {
        return response.statusCode == 200;
      });
    } catch (e) {
      throw _handleError(e);
    }
  }

  // Get posts by user ID
  static Future<List<Post>> fetchPostsByUser(int userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/posts?userId=$userId'),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 10));

      return _handleResponse<List<Post>>(response, (data) {
        final List<dynamic> jsonData = data;
        return jsonData.map((json) => Post.fromJson(json)).toList();
      });
    } catch (e) {
      throw _handleError(e);
    }
  }

  // Helper method to handle HTTP responses
  static T _handleResponse<T>(http.Response response, T Function(dynamic) parser) {
    switch (response.statusCode) {
      case 200:
      case 201:
        final dynamic data = json.decode(response.body);
        return parser(data);
      case 400:
        throw Exception('Bad Request');
      case 401:
        throw Exception('Unauthorized');
      case 403:
        throw Exception('Forbidden');
      case 404:
        throw Exception('Not Found');
      case 429:
        throw Exception('Too Many Requests');
      case 500:
        throw Exception('Internal Server Error');
      case 502:
        throw Exception('Bad Gateway');
      case 503:
        throw Exception('Service Unavailable');
      default:
        throw Exception('HTTP Error: ${response.statusCode}');
    }
  }

  // Helper method to handle errors
  static Exception _handleError(dynamic error) {
    if (error is SocketException) {
      return Exception('No internet connection');
    } else if (error is TimeoutException) {
      return Exception('Request timeout');
    } else if (error is FormatException) {
      return Exception('Invalid response format');
    } else if (error is Exception) {
      return error;
    } else {
      return Exception('Network error: $error');
    }
  }
}