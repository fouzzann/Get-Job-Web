import 'package:flutter/material.dart';
import 'package:job_search_web/services/api_services.dart';
import '../models/post.dart';

class PostProvider with ChangeNotifier {
  List<Post> _allPosts = [];
  List<Post> _filteredPosts = [];
  bool _isLoading = false;
  String _errorMessage = '';
  int? _searchUserId;
  int? _searchPostId;

  // Getters
  List<Post> get allPosts => _allPosts;
  List<Post> get filteredPosts => _filteredPosts;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  int? get searchUserId => _searchUserId;
  int? get searchPostId => _searchPostId;

  // Fetch all posts
  Future<void> fetchPosts() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _allPosts = await ApiService.fetchPosts();
      _filteredPosts = List.from(_allPosts);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  // Search functionality
  void searchPosts({int? userId, int? postId}) {
    _searchUserId = userId;
    _searchPostId = postId;

    if (postId != null) {
      // Post ID takes priority
      _filteredPosts = _allPosts.where((post) => post.id == postId).toList();
    } else if (userId != null) {
      // Filter by User ID
      _filteredPosts = _allPosts.where((post) => post.userId == userId).toList();
    } else {
      // Show all posts if both are null
      _filteredPosts = List.from(_allPosts);
    }
    
    notifyListeners();
  }

  // Clear search and show all posts
  void clearSearch() {
    _searchUserId = null;
    _searchPostId = null;
    _filteredPosts = List.from(_allPosts);
    notifyListeners();
  }

  // Refresh posts
  Future<void> refreshPosts() async {
    await fetchPosts();
  }
}