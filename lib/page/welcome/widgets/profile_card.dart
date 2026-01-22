import 'package:flutter/material.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/page/welcome/widgets/profile_image_picker.dart';
import 'package:inning/page/welcome/widgets/profile_name_field.dart';
import 'package:inning/page/welcome/widgets/profile_team_select_field.dart';

class ProfileCard extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const ProfileCard({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 50),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [AppShadows.defaultShadow],
      ),
      child: Column(
        children: [
          ProfileImagePicker(),
          SizedBox(height: 31),
          // 프로필이름필드
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 56),
            child: Column(
              children: [
                ProfileNameField(formKey: formKey),
                SizedBox(height: 16),
                // 구단선택 컨테이너
                ProfileTeamSelectField(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
