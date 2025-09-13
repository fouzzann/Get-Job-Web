
import 'package:flutter/material.dart';

class EmploymentCard extends StatelessWidget {
  const EmploymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
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
            'Employment',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),

          // Job Entry
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Senior Data Base Analyst',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.edit,
                            size: 14,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Edit Job',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                const Text(
                  'Orr Appdata Inc',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 13,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                  ),
                ),
                const SizedBox(height: 6),

                const Text(
                  'Jan 2019 to Present (3 years 1 month)',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),

                const Text(
                  'Pellentesque at auctor lectus. Aliquam vulputate mauris vel enim lobortis pharetra. Ut vehicula arcu rhoncus dolor ultricies, auctor ullamcorper nibh tristique. Pellentesque at auctor lectus. Aliquam vulputate mauris vel enim lobortis pharetra. Ut vehicula arcu rhoncus dolor ultricies, auctor ullamcorper nibh tristique.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 12),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[50],
                    foregroundColor: Colors.blue,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                  child: const Text(
                    'Projects Included in this place',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {},
            child: const Text(
              'ADD NEW EMPLOYMENT',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 19,
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
