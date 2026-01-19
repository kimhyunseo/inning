import 'package:flutter/material.dart';
import 'package:inning/core/app_color.dart';

class ProfileImagePicker extends StatelessWidget {
  const ProfileImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 사람 아이콘
        Container(
          width: 103,
          height: 103,
          decoration: BoxDecoration(
            color: AppColors.brandPopUp,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.person, size: 85, color: AppColors.brandHintText),
        ),
        // 연필 아이콘
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              color: AppColors.grey3,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.edit, size: 18, color: AppColors.grey1),
          ),
        ),
      ],
    );
  }
}
