import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/fonts.dart';
import 'package:inning/page/welcome/welcome_view_model.dart';

class ProfileNameField extends ConsumerWidget {
  // 스테이스리스위젯
  final GlobalKey<FormState> formKey;
  const ProfileNameField({super.key, required this.formKey});

  // final TextEditingController controller = TextEditingController();
  // 페이지에서 가지고 있고 속성으로 넘겨주게

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('빌드');
    // final currentNickname = ref.watch(welcomeProvider).nickname ?? '';
    // ?
    // if (controller.text != currentNickname) {
    //   print('컨트롤러');
    //   controller.text = currentNickname;
    // }
    // 필요없어질것

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
              // controller: controller,
              textAlign: TextAlign.center, // 입력하려는 글자 가로/가운데
              textAlignVertical: TextAlignVertical.center, // 입력되는 글자 세로/가운데
              decoration: InputDecoration(
                hintText: '이름',
                hintStyle: AppTextStyles.bodyPrimary16w500.copyWith(
                  color: AppColors.grey1,
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                isCollapsed: true, // 텍스트폼필드의 기본여백 완전 제거
                // 텍스트와 테두리 사이의 간격 설정
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
                if (formKey.currentState!.validate()) {
                  ref.read(welcomeProvider.notifier).updateNickname(value);
                }
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                // controller.clear();
                ref.read(welcomeProvider.notifier).updateNickname('');
              },
              child: Icon(Icons.close, size: 20, color: AppColors.grey1),
            ),
          ),
        ],
      ),
    );
  }
}
