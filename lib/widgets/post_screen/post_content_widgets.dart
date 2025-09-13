import 'package:flutter/material.dart';
import 'package:job_search_web/providers/post_provider.dart';
import 'package:job_search_web/utils/app_colors.dart';
import 'package:job_search_web/widgets/post_screen/post_cards.dart';

class PostsContentWidget extends StatelessWidget {
  final PostProvider provider;
  final bool isMobile;

  const PostsContentWidget({
    Key? key,
    required this.provider,
    this.isMobile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Loading State - Shows circular progress indicator
    if (provider.isLoading) {
      return SizedBox(
        height: isMobile ? 300 : null,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: AppColors.primaryBlue,
              ),
              SizedBox(height: 16),
              Text(
                'Loading posts...',
                style: TextStyle(color: AppColors.textMedium),
              ),
            ],
          ),
        ),
      );
    }

    // Error State - Shows error message with retry button
    if (provider.errorMessage.isNotEmpty) {
      return SizedBox(
        height: isMobile ? 300 : null,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: AppColors.error,
              ),
              const SizedBox(height: 16),
              Text(
                'Error: ${provider.errorMessage}',
                style: const TextStyle(color: AppColors.error),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => provider.fetchPosts(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    // Empty State - Shows when no posts match search criteria
    if (provider.filteredPosts.isEmpty) {
      return SizedBox(
        height: isMobile ? 300 : null,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search_off,
                size: 64,
                color: AppColors.textLight,
              ),
              SizedBox(height: 16),
              Text(
                'No posts found',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.textLight,
                ),
              ),
              Text(
                'Try adjusting your search criteria',
                style: TextStyle(color: AppColors.textLight),
              ),
            ],
          ),
        ),
      );
    }

    // Success State - Shows posts list with header
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Results Header - Shows count of available posts
        Text(
          'Recommended Posts (${provider.filteredPosts.length})',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 16),

        // Posts List - Different rendering for mobile vs desktop
        if (isMobile)
          // Mobile: Limited height scrollable list
          SizedBox(
            height: 400,
            child: ListView.builder(
              itemCount: provider.filteredPosts.length,
              itemBuilder: (context, index) {
                final post = provider.filteredPosts[index];
                return PostCard(
                  post: post,
                  onSave: () {
                    // Show success message when post is saved
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Post ${post.id} saved!'),
                        duration: const Duration(seconds: 2),
                        backgroundColor: AppColors.success,
                      ),
                    );
                  },
                );
              },
            ),
          )
        else
          // Desktop/Tablet: Full height with pull-to-refresh
          Expanded(
            child: RefreshIndicator(
              onRefresh: provider.refreshPosts,
              color: AppColors.primaryBlue,
              child: ListView.builder(
                itemCount: provider.filteredPosts.length,
                itemBuilder: (context, index) {
                  final post = provider.filteredPosts[index];
                  return PostCard(
                    post: post,
                    onSave: () {
                      // Show success message when post is saved
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Post ${post.id} saved!'),
                          duration: const Duration(seconds: 2),
                          backgroundColor: AppColors.success,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}