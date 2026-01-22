import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/fonts.dart';
import 'package:inning/page/home/stadium_view_model.dart';
import 'package:inning/page/welcome/welcome_view_model.dart';
import 'package:inning/page/chat/chat_page.dart';
import 'package:inning/page/welcome/widgets/profile_card.dart';

class WelcomePage extends ConsumerStatefulWidget {
  const WelcomePage({super.key});

  @override
  ConsumerState<WelcomePage> createState() => WelcomePageState();
}

class WelcomePageState extends ConsumerState<WelcomePage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // behavior: HitTestBehavior.opaque,
      onTap: () {
        print('온탭');
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('프로필', style: AppTextStyles.titlePrimary20w600),
        ),

        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16).copyWith(bottom: 0),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () async {
                  final stadiumState = ref.read(stadiumViewModelProvider);
                  final currentStadium = stadiumState.currentStadium;

                  if (currentStadium == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('구장 정보를 확인할 수 없습니다.')),
                    );
                    return;
                  }
                  ref.read(welcomeProvider.notifier).registerUser();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ChatPage(currentStadium: currentStadium);
                      },
                    ),
                  );
                },
                child: const Text("입력 완료"),
              ),
            ),
          ),
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 61),
                Text(
                  '이 프로필로 채팅방에 입장할까요?',
                  style: AppTextStyles.titlePrimary20w600,
                ),
                SizedBox(height: 77),
                ProfileCard(formKey: formKey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
