import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/fonts.dart';
import 'package:inning/page/welcome/welcome_view_model.dart';
import 'package:inning/page/chat/chat_page.dart';
import 'package:inning/page/welcome/widgets/profile_card.dart';

class WelcomePage extends ConsumerStatefulWidget {
  const WelcomePage({super.key});

  @override
  ConsumerState<WelcomePage> createState() => WelcomePageState();
}

class WelcomePageState extends ConsumerState<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // behavior: HitTestBehavior.opaque,
      onTap: () {
        print('온탭');
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.grey4,
        appBar: AppBar(
          title: Text('프로필', style: AppTextStyles.titlePrimary20w600),
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
                ProfileCard(),
                SizedBox(height: 250),
                SafeArea(
                  child: ElevatedButton(
                    onPressed: () {
                      // 수정
                      ref.read(welcomeProvider.notifier).registerUser(); 
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ChatPage();
                            },
                          ),
                        );
                    },
                    child: Text('입력 완료'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
