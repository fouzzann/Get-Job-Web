
import 'package:flutter/material.dart';
import 'package:job_search_web/widgets/profile_screen/profile_details_section.dart';
import 'package:job_search_web/widgets/profile_screen/quick_edits_sidebar.dart';

class ProfileMainContent extends StatelessWidget {
  final bool isMobile;

  const ProfileMainContent({
    super.key,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Sidebar - Quick Edits
        SizedBox(
          width: isMobile ? double.infinity : 220,
          child: const QuickEditsSidebar(),
        ),

        if (!isMobile) const SizedBox(width: 24),

        // Main Content Area
        if (!isMobile) const Expanded(child: ProfileDetailsSection()),
      ],
    );
  }
}
