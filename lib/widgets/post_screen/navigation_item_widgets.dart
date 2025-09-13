import 'package:flutter/material.dart';
import 'package:job_search_web/utils/app_colors.dart';

class NavigationItemWidget extends StatelessWidget {
  final String title;
  final bool isActive;

  const NavigationItemWidget({
    Key? key,
    required this.title,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 32),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: isActive ? FontWeight.w800 : FontWeight.normal,
          color: isActive ? AppColors.accentPurple : AppColors.textDark,
        ),
      ),
    );
  }
}