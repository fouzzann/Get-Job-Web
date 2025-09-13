import 'package:flutter/material.dart';
import 'package:job_search_web/providers/post_provider.dart';
import 'package:job_search_web/widgets/post_screen/post_content_widgets.dart';
import 'package:job_search_web/widgets/post_screen/search_sessions.dart';
import 'package:job_search_web/widgets/post_screen/side_bar_widgets.dart';
import 'package:provider/provider.dart';
class MobileLayoutWidget extends StatelessWidget {
  const MobileLayoutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Search Section - Top priority on mobile
          Padding(
            padding: const EdgeInsets.all(16),
            child: SearchSection(
              onSearch: (userId, postId) {
                // Trigger search in PostProvider
                context.read<PostProvider>().searchPosts(
                      userId: userId,
                      postId: postId,
                    );
              },
              onClear: () {
                // Clear search results in PostProvider
                context.read<PostProvider>().clearSearch();
              },
            ),
          ),

          // Profile Card - Moved to top on mobile for better accessibility
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SidebarWidget(),
          ),
          const SizedBox(height: 16),

          // Posts Section - Main content area
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Consumer<PostProvider>(
              builder: (context, provider, child) {
                return PostsContentWidget(
                  provider: provider,
                  isMobile: true,
                ); 
              },
            ),
          ),
        ],
      ),
    );
  }
}