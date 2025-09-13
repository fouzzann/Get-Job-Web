
import 'package:flutter/material.dart';

class QuickEditsSidebar extends StatelessWidget {
  const QuickEditsSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final quickEditItems = [
      {'title': 'Attach Resume', 'isLink': true},
      {'title': 'Resume Headline', 'isLink': false},
      {'title': 'Key Skills', 'isLink': false},
      {'title': 'Employment', 'isLink': false},
      {'title': 'Education', 'isLink': false},
      {'title': 'IT Skills', 'isLink': false},
      {'title': 'Projects', 'isLink': false},
      {'title': 'Profile Summary', 'isLink': false},
      {'title': 'Accomplishments', 'isLink': false},
      {'title': 'Career Profile', 'isLink': false},
      {'title': 'Personal Details', 'isLink': false},
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quick Edits',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),

          ...quickEditItems
              .map(
                (item) => Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      item['title'] as String,
                      style: TextStyle(
                        color: item['isLink'] == true
                            ? Colors.blue
                            : Colors.black87,
                        decoration: item['isLink'] == true
                            ? TextDecoration.underline
                            : null,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}