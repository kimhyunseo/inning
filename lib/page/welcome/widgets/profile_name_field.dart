import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/fonts.dart';
import 'package:inning/page/welcome/welcome_view_model.dart';
import 'package:inning/page/welcome/widgets/profile_input_field.dart';

class ProfileNameField extends ConsumerWidget {
  ProfileNameField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              //
              onChanged: (value) {
                ref.read(welcomeProvider.notifier).updateNickname(value);
              },

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
                // if (formKey.currentState!.validate()) {
                //   ref.read(welcomeProvider.notifier).updateNickname(value);
                // }
                // 수정
              },
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
