import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_search_web/providers/post_provider.dart';
import 'package:job_search_web/widgets/post_screen/post_content_widgets.dart';
import 'package:job_search_web/widgets/post_screen/search_sessions.dart';
import 'package:job_search_web/widgets/post_screen/side_bar_widgets.dart';
import 'package:provider/provider.dart';
import 'package:job_search_web/screens/profile_page.dart';


class DesktopLayoutWidget extends StatelessWidget {
  final bool isTablet;
  final bool isDesktop;

  const DesktopLayoutWidget({
    Key? key,
    required this.isTablet,
    required this.isDesktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main Posts Section - Takes up most of the horizontal space
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              isDesktop ? 100 : (isTablet ? 50 : 24),  // Responsive left padding
              isDesktop ? 100 : (isTablet ? 50 : 24),  // Responsive top padding
              24,                                        // Right padding
              isDesktop ? 100 : (isTablet ? 50 : 24),  // Responsive bottom padding
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Section - Allows users to filter posts
                SearchSection(
                  onSearch: (userId, postId) {
                    // Execute search with provided parameters
                    context.read<PostProvider>().searchPosts(
                          userId: userId,
                          postId: postId,
                        );
                  },
                  onClear: () {
                    // Reset search and show all posts
                    context.read<PostProvider>().clearSearch();
                  },
                ),
                const SizedBox(height: 24),

                // Posts List Section - Main content area with job posts
                Expanded(
                  child: Consumer<PostProvider>(
                    builder: (context, provider, child) {
                      return PostsContentWidget(
                        provider: provider,
                        isMobile: false,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),

        // Sidebar - Profile information and additional actions
        GestureDetector(
          onTap: () {
            // Navigate to detailed profile screen
            Get.to(() => ProfileScreen());
          },
          child: Container(
            width: isTablet ? 300 : 350,  // Responsive sidebar width
            padding: EdgeInsets.fromLTRB(
              8,
              isDesktop ? 100 : (isTablet ? 50 : 24),  // Responsive top padding
              24,
              24,
            ),
            child: SingleChildScrollView(
              child: SidebarWidget(),
            ),
          ),
        ),
        const SizedBox(width: 100),  // Right margin for desktop spacing
      ],
    );
  }
}