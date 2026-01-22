class ChatMessage {
  final String? id;
  final String content; // 메시지 내용
  final String senderId; // 보낸 사람 ID
  final String senderNickname; // 보낸 사람 닉네임
  final DateTime createdAt; // 보낸 시간

  ChatMessage({
    this.id,
    required this.content,
    required this.senderId,
    required this.senderNickname,
    required this.createdAt,
  });

  // Firestore에서 가져올 때
  factory ChatMessage.fromJson(String id, Map<String, dynamic> json) {
    return ChatMessage(
      id: id,
      content: json['content'] as String,
      senderId: json['senderId'] as String,
      senderNickname: json['senderNickname'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'senderId': senderId,
      'senderNickname': senderNickname,
      'createdAt': DateTime.now().toIso8601String(),
    };
  }
}
