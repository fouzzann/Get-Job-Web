import 'package:flutter/material.dart';
import 'package:job_search_web/widgets/profile_screen/asills_card.dart';
import 'package:job_search_web/widgets/profile_screen/attach_resume_card.dart';
import 'package:job_search_web/widgets/profile_screen/education_card.dart';
import 'package:job_search_web/widgets/profile_screen/eployment_card.dart';
import 'package:job_search_web/widgets/profile_screen/profile_info_card.dart';

class ProfileDetailsSection extends StatelessWidget {
  const ProfileDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AttachResumeCard(),
        ProfileInfoCard(
          title: 'Resume Headline',
          content: 'Experienced and reliable database analyst skilled in designing and maintaining high-performing systems.',
          hasAction: true,
          actionText: 'Update',
        ),
        EmploymentCard(),
        EducationCard(),
        SkillsCard(),
      ],
    );
  }
}