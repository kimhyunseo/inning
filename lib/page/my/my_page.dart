import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/fonts.dart';
import 'package:inning/page/welcome/welcome_view_model.dart';
import 'package:inning/page/welcome/widgets/profile_card.dart';

class MyPage extends ConsumerStatefulWidget {
  const MyPage({super.key});

  @override
  ConsumerState<MyPage> createState() => _MyPageState();
}

class _MyPageState extends ConsumerState<MyPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '프로필 수정',
          style: AppTextStyles.titlePrimary20w600,
        ), // 타이틀 변경
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16).copyWith(bottom: 0),
          child: SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () async {
                // 1. 폼 검증 (이름 등)
                if (formKey.currentState?.validate() ?? false) {
                  // 2. ViewModel을 통해 데이터베이스 업데이트 수행
                  // registerUser가 아닌 updateUserInfo(새로 만들 로직) 호출
                  await ref.read(welcomeProvider.notifier).updateUserInfo();

                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('프로필이 수정되었습니다.')),
                    );
                    Navigator.pop(context); // 수정 후 이전 화면으로
                  }
                }
              },
              child: const Text("수정 완료"), // 버튼 텍스트 변경
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 61),
                ProfileCard(formKey: formKey), // 기존 카드 위젯 재사용
              ],
            ),
          ),
        ),
      ),
    );
  }
}
