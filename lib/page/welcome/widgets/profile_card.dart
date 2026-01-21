import 'package:flutter/material.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/app_shadow.dart';
import 'package:inning/page/welcome/widgets/profile_image_picker.dart';
import 'package:inning/page/welcome/widgets/profile_name_field.dart';
import 'package:inning/page/welcome/widgets/profile_team_select_field.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 283,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [AppShadows.defaultShadow],
      ),
      child: Column(
        children: [
          SizedBox(height: 30),
          ProfileImagePicker(),
          SizedBox(height: 31),
          // 프로필이름필드
          ProfileNameField(),
          SizedBox(height: 16),
          // 구단선택 컨테이너
          ProfileTeamSelectField(),
        ],
      ),
    );
  }
}
