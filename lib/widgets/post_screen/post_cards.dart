import 'package:flutter/material.dart';
import '../../models/post.dart';
import '../../utils/app_colors.dart'; // 👈 import your color class

class PostCard extends StatelessWidget {
  final Post post;
  final VoidCallback? onSave;

  const PostCard({Key? key, required this.post, this.onSave}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            // Primary shadow
            BoxShadow(
              color: AppColors.shadowLight,
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
            // Secondary shadow
            BoxShadow(
              color: AppColors.shadowDark,
              spreadRadius: 1,
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.greyLight,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'P${post.id}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Ora Apps inc',
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.greyDark,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.greyText,
                            decorationThickness: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: onSave,
                    icon: const Icon(
                      Icons.bookmark_border,
                      color: AppColors.greyMedium,
                    ),
                  ),
                  const Text(
                    'save',
                    style: TextStyle(color: AppColors.greyMedium),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Job details (responsive wrap)
              Wrap(
                spacing: 20,
                runSpacing: 8,
                children: [
                  _buildInfoChip(
                      icon: Icons.location_on,
                      label: 'Remote or Hyattsville,MD,USA'),
                  _buildInfoChip(
                      icon: Icons.card_travel_outlined, label: '2 to 8 yrs'),
                  _buildInfoChip(
                      icon: Icons.attach_money_outlined,
                      label: 'Not Disclosed'),
                ],
              ),

              const SizedBox(height: 12),

              _buildInfoChip(
                icon: Icons.description_outlined,
                label:
                    'Join our team growing software professionals Ever found yourself working with an open source library that is just not working...',
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildInfoChip({required IconData icon, required String label}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: AppColors.primaryBlueLight),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            label,
            style: const TextStyle(fontSize: 15, color: AppColors.greyText),
          ),
        ),
      ],
    );
  }
}
