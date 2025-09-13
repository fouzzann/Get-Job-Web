
import 'package:flutter/material.dart';

class ProfileTabNavigation extends StatelessWidget {
  const ProfileTabNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = ['Profile', 'Saved Jobs', 'Custom Job Alerts'];

    return Row(
      children: tabs.asMap().entries.map((entry) {
        final index = entry.key;
        final label = entry.value;
        final isActive = index == 0; // Profile is active

        return Container(
          margin: const EdgeInsets.only(right: 12),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: isActive ? Colors.deepPurple : Colors.grey[200],
              foregroundColor: isActive ? Colors.white : Colors.black87,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: Text(
              label,
              style: TextStyle(
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}