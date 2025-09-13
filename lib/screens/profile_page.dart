import 'package:flutter/material.dart';
import 'package:job_search_web/widgets/profile_screen/profile_header_card.dart';
import 'package:job_search_web/widgets/profile_screen/profile_main_content.dart';
import 'package:job_search_web/widgets/profile_screen/profile_tab_navigation.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(isMobile ? 16 : 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile header with gradient background and user info
              ProfileHeaderCard(),
              const SizedBox(height: 24),
              
              // Tab navigation for Profile, Saved Jobs, Custom Job Alerts
              ProfileTabNavigation(),
              const SizedBox(height: 24),
              
              // Main content area with sidebar and profile details
              ProfileMainContent(isMobile: isMobile),
            ],
          ),
        ),
      ),
    );
  }
}







