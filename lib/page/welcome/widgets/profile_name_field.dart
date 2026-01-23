import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/fonts.dart';
import 'package:inning/page/welcome/welcome_view_model.dart';

class ProfileNameField extends ConsumerStatefulWidget {
  final GlobalKey<FormState> formKey;
  const ProfileNameField({super.key, required this.formKey});

  // 페이지에서 가지고 있고 속성으로 넘겨주게
  @override
  ConsumerState<ProfileNameField> createState() => ProfileNameFieldState();
}

class ProfileNameFieldState extends ConsumerState<ProfileNameField> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(
      text: ref.read(welcomeProvider).nickname,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('빌드');
    // final currentNickname = ref.watch(welcomeProvider).nickname;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.grey4,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          SizedBox(width: 32),
          Expanded(
            child: TextFormField(
              controller: controller,
              autofocus: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // initialValue: currentNickname,
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
                print('온체인지');
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
                print('온필드서브');
                if (widget.formKey.currentState!.validate()) {
                  ref.read(welcomeProvider.notifier).updateNickname(value);
                }
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                controller.clear();
                ref.read(welcomeProvider.notifier).updateNickname('');
                // widget.formKey.currentState?.validate();
              },
              child: Icon(Icons.close, size: 20, color: AppColors.grey1),
            ),
          ),
        ],
      ),
    );
  }
}
