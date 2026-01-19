import 'package:flutter/material.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/fonts.dart';
import 'package:inning/page/welcome/widgets/profile_input_field.dart';

class ProfileSelectField extends StatelessWidget {
  const ProfileSelectField({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileInputField(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(20 / 2),
            child: Image.network('https://picsum.photos/20'),
          ),
          // Spacer(),
          Text(
            '구단',
            style: AppTextStyles.bodyPrimary16w500.copyWith(
              color: AppColors.grey1,
            ),
          ),
          // Spacer(),
          Icon(Icons.arrow_forward_outlined, size: 20, color: AppColors.grey1),
        ],
      ),
    );
  }
}
