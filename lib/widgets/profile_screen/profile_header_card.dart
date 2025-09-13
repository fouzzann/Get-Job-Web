import 'package:flutter/material.dart';
import 'package:job_search_web/widgets/profile_screen/icon_text_widget.dart';

class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFE1C4FD), Color(0xFFD1B2F7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ), 
      child: Column(
        children: [
          // Top section with profile info
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Image
                const CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage('assets/john wick.png'),
                ),
                const SizedBox(width: 16),

                // Name and Role
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'John Wick Paul II',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Senior Data Base Analyst at Orr Appdata Inc',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Profile Completion
                      Row(
                        children: [
                          const Text(
                            'Profile Completion',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            '100%',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: 1.0,
                          minHeight: 6,
                          backgroundColor: Colors.white.withValues(alpha: 0.3),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Edit Profile Button
                Container(
                  margin: const EdgeInsets.only(left: 16),
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      size: 16,
                      color: Colors.deepPurple,
                    ),
                    label: const Text("Edit Profile"),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom white section with contact info
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: const Wrap(
              runSpacing: 12,
              spacing: 40,
              children: [
                IconTextWidget(
                  icon: Icons.location_on,
                  text: 'Hyattsville, MD, USA',
                ),
                IconTextWidget(
                  icon: Icons.access_time,
                  text: '7 Year(s) and 3 Month(s)',
                ),
                IconTextWidget(
                  icon: Icons.attach_money,
                  text: 'INR 9 Lakh(s) and 75 Thousand(s)',
                ),
                IconTextWidget(
                  icon: Icons.phone,
                  text: '+1 789 658 65 63 / +1 457 965 78 96',
                ),
                IconTextWidget(icon: Icons.email, text: 'johnwickpaulii@gmail.com'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

