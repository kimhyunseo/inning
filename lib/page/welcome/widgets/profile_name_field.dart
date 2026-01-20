import 'package:flutter/material.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/fonts.dart';
import 'package:inning/page/welcome/widgets/profile_input_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class ProfileNameField extends StatefulWidget {
  const ProfileNameField({super.key});

  @override
  State<ProfileNameField> createState() => _ProfileNameFieldState();
}

class _ProfileNameFieldState extends State<ProfileNameField> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ProfileInputField(
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
                controller: nameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return '이름을 입력해주세요';
                  }
                  if (value.length < 2) {
                    return '2자 이상 입력해주세요.';
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  // registerUser();
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.close, size: 20, color: AppColors.grey1),
            ),
          ],
        ),
      ),
    );
  }
}
