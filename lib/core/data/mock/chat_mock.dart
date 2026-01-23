import 'package:inning/core/model/chat_message.dart';
import 'package:inning/core/model/user.dart';

// 💡 stadiumId 매개변수를 추가했습니다.
List<ChatMessage> createMockMessages(
  List<User> users,
  User currentUser,
  String stadiumId,
) {
  User? findUser(String id) {
    try {
      return users.firstWhere((u) => u.id == id);
    } catch (e) {
      return null;
    }
  }

  if (stadiumId == 'stadium_incheon') {
    return [
      ChatMessage(
        id: 'ssg_1',
        senderId: findUser('user2')?.id ?? 'user2',
        senderNickname: findUser('user2')?.nickname ?? "랜더스팬",
        content: '오늘 랜필 크림새우 벌써 줄 엄청 길어요! 🍤',
        createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
      ),
      ChatMessage(
        id: 'ssg_2',
        senderId: currentUser.id,
        senderNickname: currentUser.nickname ?? "나",
        content: '와 벌써요? 3층까지 줄 서있나요?',
        createdAt: DateTime.now().subtract(const Duration(minutes: 8)),
      ),
      ChatMessage(
        id: 'ssg_3',
        senderId: findUser('user3')?.id ?? 'user3',
        senderNickname: findUser('user3')?.nickname ?? "최정팬",
        content: '방금 최정 홈런!! 역시 인천의 자부심입니다 🔥',
        createdAt: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
    ];
  }

  if (stadiumId == 'stadium_jamsil') {
    return [
      ChatMessage(
        id: 'jam_1',
        senderId: findUser('user4')?.id ?? 'user4',
        senderNickname: findUser('user4')?.nickname ?? "잠실비타민",
        content: '잠실 날씨가 조금 흐린데 경기 끝까지 하겠죠?',
        createdAt: DateTime.now().subtract(const Duration(minutes: 15)),
      ),
      ChatMessage(
        id: 'jam_2',
        senderId: findUser('user5')?.id ?? 'user5',
        senderNickname: findUser('user5')?.nickname ?? "철웅이최고",
        content: '방금 중앙 매점 떡볶이 먹었는데 맛있네요 ㅎㅎ',
        createdAt: DateTime.now().subtract(const Duration(minutes: 12)),
      ),
      ChatMessage(
        id: 'jam_3',
        senderId: currentUser.id,
        senderNickname: currentUser.nickname ?? "나",
        content: '오 저도 가봐야겠네요! 정보 감사합니다.',
        createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
      ),
    ];
  }

  return [
    ChatMessage(
      id: 'm1',
      senderId: findUser('user2')?.id ?? 'user2',
      senderNickname: findUser('user2')?.nickname ?? "유저2",
      content: '안녕하세요! 여기는 기본 채팅방입니다.',
      createdAt: DateTime.now().subtract(const Duration(minutes: 60)),
    ),
    ChatMessage(
      id: 'm2',
      senderId: currentUser.id,
      senderNickname: currentUser.nickname ?? "나",
      content: '반가워요! 구장 정보가 확인되지 않아 기본방으로 입장했어요.',
      createdAt: DateTime.now().subtract(const Duration(minutes: 58)),
    ),
  ];
}
