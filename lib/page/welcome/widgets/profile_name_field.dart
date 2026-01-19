import 'package:flutter/material.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/fonts.dart';
import 'package:inning/page/welcome/widgets/profile_input_field.dart';

class ProfileNameField extends StatelessWidget {
  ProfileNameField({super.key});

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ProfileInputField(
      child: Row(
        children: [
          SizedBox(width: 32),
          Expanded(
            child: TextFormField(
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: '이름',
                hintStyle: AppTextStyles.bodyPrimary16w500.copyWith(
                  color: AppColors.grey1,
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                isCollapsed: true,
                contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.close, size: 20, color: AppColors.grey1),
          ),
        ],
      ),
    );
  }
}
