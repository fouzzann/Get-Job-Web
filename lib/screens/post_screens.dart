import 'package:flutter/material.dart';
import 'package:job_search_web/utils/app_colors.dart';
import 'package:job_search_web/widgets/post_screen/custom_header_widgets.dart';
import 'package:job_search_web/widgets/post_screen/desktop_layout_widgets.dart';
import 'package:job_search_web/widgets/post_screen/mobile_layout_widgets.dart';
class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine screen breakpoints for responsive design
        final screenWidth = constraints.maxWidth;
        final bool isMobile = screenWidth < 800;
        final bool isTablet = screenWidth >= 800 && screenWidth < 1200;
        final bool isDesktop = screenWidth >= 1200;

        return Scaffold(
          backgroundColor: AppColors.appBackground,
          body: Column(
            children: [
              // Header section - contains navigation, logo, and profile
              CustomHeaderWidget(isMobile: isMobile),

              // Main content area - switches between mobile and desktop layouts
              Expanded(
                child: isMobile
                    ? MobileLayoutWidget()
                    : DesktopLayoutWidget(
                        isTablet: isTablet,
                        isDesktop: isDesktop,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}