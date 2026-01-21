import 'package:inning/core/model/chat_message.dart';
import 'package:inning/core/model/user.dart';

// Firebase에서 가져온 유저 리스트를 전달
List<ChatMessage> createMockMessages(List<User> users, User currentUser) {
  // 사용자 찾기 helper
  User? findUser(String id) {
    try {
      return users.firstWhere((u) => u.id == id);
    } catch (e) {
      return null;
    }
  }

  return [
    // ── 유저1 연속 메시지
    ChatMessage(
      id: 'm1',
      senderId: findUser('user2')?.id ?? 'user2',
      senderNickname: findUser('user2')?.nickname ?? "유저2",
      content: '안녕하세요!',
      createdAt: DateTime.now().subtract(const Duration(minutes: 60)),
    ),
    ChatMessage(
      id: 'm2',
      senderId: findUser('user2')?.id ?? 'user2',
      senderNickname: findUser('user2')?.nickname ?? "유저2",
      content: '여기 채팅방 처음 와보네요',
      createdAt: DateTime.now().subtract(const Duration(minutes: 59)),
    ),

    // ── 나 연속 메시지
    ChatMessage(
      id: 'm3',
      senderId: currentUser.id,
      senderNickname: currentUser.nickname ?? "나",
      content: '어서오세요 👋',
      createdAt: DateTime.now().subtract(const Duration(minutes: 58)),
    ),
    ChatMessage(
      id: 'm4',
      senderId: currentUser.id,
      senderNickname: currentUser.nickname ?? "나",
      content: '야구 좋아하시면 여기 재밌어요',
      createdAt: DateTime.now().subtract(const Duration(minutes: 57)),
    ),

    // ── 유저3 긴 메시지
    ChatMessage(
      id: 'm5',
      senderId: findUser('user3')?.id ?? 'user3',
      senderNickname: findUser('user3')?.nickname ?? "유저3",
      content: '오늘 경기 진짜 손에 땀을 쥐게 하더라구요. 특히 마지막 회 마지막 수비는 정말 인상 깊었어요.',
      createdAt: DateTime.now().subtract(const Duration(minutes: 55)),
    ),
    ChatMessage(
      id: 'm6',
      senderId: findUser('user3')?.id ?? 'user3',
      senderNickname: findUser('user3')?.nickname ?? "유저3",
      content: '저는 개인적으로 투수 교체 타이밍이 가장 중요하다고 생각해요.',
      createdAt: DateTime.now().subtract(const Duration(minutes: 54)),
    ),

    // ── 유저4 연속 메시지
    ChatMessage(
      id: 'm7',
      senderId: findUser('user4')?.id ?? 'user4',
      senderNickname: findUser('user4')?.nickname ?? "유저4",
      content: '두산 팬 입장에서는 조금 아쉬웠네요 😅',
      createdAt: DateTime.now().subtract(const Duration(minutes: 52)),
    ),
    ChatMessage(
      id: 'm8',
      senderId: findUser('user4')?.id ?? 'user4',
      senderNickname: findUser('user4')?.nickname ?? "유저4",
      content: '그래도 경기 자체는 재밌었어요!',
      createdAt: DateTime.now().subtract(const Duration(minutes: 51)),
    ),

    // ── 나 긴 메시지
    ChatMessage(
      id: 'm9',
      senderId: currentUser.id,
      senderNickname: currentUser.nickname ?? "나",
      content:
          '저는 오늘 경기에서 투수 교체 타이밍이 정말 중요했다고 생각해요. 특히 7회 말 상황에서 감독 판단이 승부를 갈랐다고 봐요.',
      createdAt: DateTime.now().subtract(const Duration(minutes: 50)),
    ),

    // ── 유저5 메시지
    ChatMessage(
      id: 'm10',
      senderId: findUser('user5')?.id ?? 'user5',
      senderNickname: findUser('user5')?.nickname ?? "유저5",
      content: 'KT 요즘 분위기 좋지 않나요?',
      createdAt: DateTime.now().subtract(const Duration(minutes: 48)),
    ),
    ChatMessage(
      id: 'm11',
      senderId: findUser('user5')?.id ?? 'user5',
      senderNickname: findUser('user5')?.nickname ?? "유저5",
      content: '선발 로테이션이 진짜 안정적인 듯',
      createdAt: DateTime.now().subtract(const Duration(minutes: 47)),
    ),

    // ── 팀 없는 유저
    ChatMessage(
      id: 'm12',
      senderId: findUser('user6')?.id ?? 'user6',
      senderNickname: findUser('user6')?.nickname ?? "유저6",
      content: '저는 그냥 야구 자체를 좋아해요',
      createdAt: DateTime.now().subtract(const Duration(minutes: 45)),
    ),

    // ── 최신 메시지
    ChatMessage(
      id: 'm13',
      senderId: currentUser.id,
      senderNickname: currentUser.nickname ?? "나",
      content: '다음 주 경기 같이 보실 분?',
      createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
    ),
    ChatMessage(
      id: 'm14',
      senderId: currentUser.id,
      senderNickname: currentUser.nickname ?? "나",
      content: '단체 관람도 재밌을 것 같아요',
      createdAt: DateTime.now().subtract(const Duration(minutes: 9)),
    ),
    ChatMessage(
      id: 'm15',
      senderId: findUser('user2')?.id ?? 'user2',
      senderNickname: findUser('user2')?.nickname ?? "유저2",
      content: '오 좋죠! 일정 맞으면 꼭 갈게요',
      createdAt: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
  ];
}
