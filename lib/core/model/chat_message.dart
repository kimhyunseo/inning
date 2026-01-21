import 'package:inning/core/model/user.dart';

class ChatMessage {
  final String id;
  final String content; // 메시지 내용
  final User sender; // 보낸 사람(User 객체)
  final DateTime time; // 보낸 시간

  ChatMessage({
    required this.id,
    required this.content,
    required this.sender,
    required this.time,
  });
}
