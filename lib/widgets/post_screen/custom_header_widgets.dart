import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_search_web/providers/post_provider.dart';
import 'package:job_search_web/widgets/post_screen/navigation_item_widgets.dart';
import 'package:provider/provider.dart';
import 'package:job_search_web/screens/profile_page.dart';
import 'package:job_search_web/utils/app_colors.dart';

class CustomHeaderWidget extends StatelessWidget {
  final bool isMobile;

  const CustomHeaderWidget({
    Key? key,
    required this.isMobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: AppColors.appBarBackground,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: SizedBox(
        height: 50,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Left Navigation - Only shown on desktop/tablet
            if (!isMobile)
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    const SizedBox(width: 100),
                    NavigationItemWidget(title: 'Home', isActive: false),
                    NavigationItemWidget(title: 'Search Posts', isActive: true),
                    NavigationItemWidget(title: 'Companies', isActive: false),
                    NavigationItemWidget(title: 'Post Jobs', isActive: false),
                  ],
                ),
              ),

            // Center Logo + Text - App branding section
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/Screenshot_2025-09-12_185141-removebg-preview.png',
                  height: 40,
                ),
                const SizedBox(width: 6),
                const Text(
                  "GetJob",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: AppColors.textDark,
                  ),
                ),
              ],
            ),

            // Right User Profile Section - Contains notifications and user info
            Align(
              alignment: Alignment.centerRight,
              child: Consumer<PostProvider>(
                builder: (context, provider, child) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Notification icon
                      const Icon(
                        Icons.notifications_outlined,
                        size: 22,
                        color: AppColors.accentPurple,
                      ),
                      const SizedBox(width: 12),
                      
                      // User profile section (desktop/tablet only)
                      if (!isMobile)
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Navigate to profile screen
                                Get.to(() => ProfileScreen());
                              },
                              child: const CircleAvatar(
                                radius: 16,
                                backgroundImage: AssetImage(
                                  'assets/john wick.png',
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Text(
                              'Hello, John Wick',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: AppColors.textDark,
                              ),
                            ),
                            const SizedBox(width: 120),
                          ],
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}