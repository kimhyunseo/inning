import 'package:flutter/material.dart';
import 'package:inning/page/chat/widgets/chat_tap_app_bar.dart';
import 'package:inning/page/chat/widgets/chat_tap_list_view.dart';
import 'package:inning/page/chat/widgets/chat_tap_notice.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. 테마의 배경색이 적용되도록 설정
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      // 2. 앱바(삭제할 것 파일)
      appBar: const ChatTapAppBar(),

      body: Column(
        children: [
          // 공지사항 영역
          const ChatTapNotice(),

          // 채팅 리스트 영역 (남은 공간을 꽉 채움)
          const Expanded(child: ChatTapListView()),

          // 메시지 입력 바 (Column의 가장 하단에 배치)
          MessageBar(
            onSend: (text) => print('테스트:messages'),
            actions: [
              InkWell(
                child: const Icon(Icons.add, color: Colors.black, size: 24),
                onTap: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: InkWell(
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.green,
                    size: 24,
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
