import 'package:inning/core/model/chat_message.dart';
import 'package:inning/core/data/mock/user_mock.dart';

final List<ChatMessage> mockMessages = [
  // ── 유저1 연속 메시지
  ChatMessage(
    id: 'm1',
    senderId: mockUsers[1].id,
    senderNickname: mockUsers[1].nickname ?? "유저1",
    content: '안녕하세요!',
    createdAt: DateTime.now().subtract(const Duration(minutes: 60)),
  ),
  ChatMessage(
    id: 'm2',
    senderId: mockUsers[1].id,
    senderNickname: mockUsers[1].nickname ?? "유저1",
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

  // ── 유저2 긴 메시지
  ChatMessage(
    id: 'm5',
    senderId: mockUsers[2].id,
    senderNickname: mockUsers[2].nickname ?? "유저2",
    content:
        '오늘 경기 진짜 손에 땀을 쥐게 하더라구요. '
        '특히 마지막 회 마지막 수비는 정말 인상 깊었어요. '
        '야구는 역시 데이터와 감각이 함께하는 스포츠인 것 같아요!',
    createdAt: DateTime.now().subtract(const Duration(minutes: 55)),
  ),
  ChatMessage(
    id: 'm6',
    senderId: mockUsers[2].id,
    senderNickname: mockUsers[2].nickname ?? "유저2",
    content: '저는 개인적으로 투수 교체 타이밍이 가장 중요하다고 생각해요.',
    createdAt: DateTime.now().subtract(const Duration(minutes: 54)),
  ),

  // ── 유저3 연속 메시지
  ChatMessage(
    id: 'm7',
    senderId: mockUsers[3].id,
    senderNickname: mockUsers[3].nickname ?? "유저3",
    content: '두산 팬 입장에서는 조금 아쉬웠네요 😅',
    createdAt: DateTime.now().subtract(const Duration(minutes: 52)),
  ),
  ChatMessage(
    id: 'm8',
    senderId: mockUsers[3].id,
    senderNickname: mockUsers[3].nickname ?? "유저3",
    content: '그래도 경기 자체는 재밌었어요!',
    createdAt: DateTime.now().subtract(const Duration(minutes: 51)),
  ),

  // ── 나 긴 메시지
  ChatMessage(
    id: 'm9',
    senderId: currentUser.id,
    senderNickname: currentUser.nickname ?? "나",
    content:
        '저는 오늘 경기에서 투수 교체 타이밍이 정말 중요했다고 생각해요. '
        '특히 7회 말 상황에서 감독 판단이 승부를 갈랐다고 봐요. '
        '이런 경기 보면 야구가 진짜 데이터와 감각의 스포츠라는 게 느껴져요. '
        '그리고 스트라이크 존 안정 덕분에 타자들의 플레이 보는 재미가 더 커진 느낌이에요.',
    createdAt: DateTime.now().subtract(const Duration(minutes: 50)),
  ),

  // ── 유저4 메시지
  ChatMessage(
    id: 'm10',
    senderId: mockUsers[4].id,
    senderNickname: mockUsers[4].nickname ?? "유저4",
    content: 'KT 요즘 분위기 좋지 않나요?',
    createdAt: DateTime.now().subtract(const Duration(minutes: 48)),
  ),
  ChatMessage(
    id: 'm11',
    senderId: mockUsers[4].id,
    senderNickname: mockUsers[4].nickname ?? "유저4",
    content: '선발 로테이션이 진짜 안정적인 듯',
    createdAt: DateTime.now().subtract(const Duration(minutes: 47)),
  ),

  // ── 팀 없는 유저
  ChatMessage(
    id: 'm12',
    senderId: mockUsers[5].id,
    senderNickname: mockUsers[5].nickname ?? "유저5",
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
    senderId: mockUsers[1].id,
    senderNickname: mockUsers[1].nickname ?? "유저1",
    content: '오 좋죠! 일정 맞으면 꼭 갈게요',
    createdAt: DateTime.now().subtract(const Duration(minutes: 5)),
  ),
];
