import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:inning/page/chat/widgets/chat_message.dart';

class ChatTapListView extends StatelessWidget {
  const ChatTapListView({super.key});

  @override
  Widget build(BuildContext context) {
    // 테스트용
    final List<ChatMessage> messages = [
      ChatMessage(content: '안녕하세요', isMe: false),
      ChatMessage(content: '여기\n맛집이\n어디\n있나요\n?', isMe: false),
      ChatMessage(content: '경기장 안쪽에 치킨집 맛있습니다.', isMe: true),
    ];

    return ListView.builder(
      // 메시지 길이만큼 전달하기
      itemCount: messages.length,
      // 말풍선 크기조정
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      itemBuilder: (context, index) {
        final chat = messages[index];
        // 위젯을 리턴해줘야 적용이 된다.
        // 버블 패키지 예문에 있음
        return BubbleSpecialThree(
          text: chat.content,
          color: Colors.white,
          // 말풍선 꼬리 유무
          tail: false,
          textStyle: TextStyle(color: Colors.black, fontSize: 14),
        );
      },
    );
  }
}
