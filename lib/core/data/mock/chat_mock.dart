import 'package:inning/core/model/chat_message.dart';
import 'package:inning/core/data/mock/user_mock.dart';

final List<ChatMessage> mockMessages = [
  ChatMessage(
    id: 'm1',
    sender: mockUsers[1],
    content: '안녕하세요!',
    time: DateTime.now().subtract(const Duration(minutes: 60)),
  ),
  ChatMessage(
    id: 'm2',
    sender: mockUsers[1],
    content: '여기 채팅방 처음 와보네요',
    time: DateTime.now().subtract(const Duration(minutes: 59)),
  ),

  ChatMessage(
    id: 'm3',
    sender: currentUser,
    content: '어서오세요 👋',
    time: DateTime.now().subtract(const Duration(minutes: 58)),
  ),
  ChatMessage(
    id: 'm4',
    sender: currentUser,
    content: '야구 좋아하시면 여기 재밌어요',
    time: DateTime.now().subtract(const Duration(minutes: 57)),
  ),

  // ── 연속 (지우)
  ChatMessage(
    id: 'm5',
    sender: mockUsers[2],
    content: '오늘 경기 보셨어요?',
    time: DateTime.now().subtract(const Duration(minutes: 55)),
  ),
  ChatMessage(
    id: 'm6',
    sender: mockUsers[2],
    content: 'LG 경기 진짜 손에 땀을 쥐게 하더라구요',
    time: DateTime.now().subtract(const Duration(minutes: 54)),
  ),
  ChatMessage(
    id: 'm7',
    sender: mockUsers[2],
    content: '마지막 수비가 특히 인상 깊었어요',
    time: DateTime.now().subtract(const Duration(minutes: 53)),
  ),

  // ── 내가 답장
  ChatMessage(
    id: 'm8',
    sender: currentUser,
    content: '맞아요 ㅋㅋ 마지막 진짜 숨 못 쉬는 줄',
    time: DateTime.now().subtract(const Duration(minutes: 52)),
  ),

  // ── 수현
  ChatMessage(
    id: 'm9',
    sender: mockUsers[3],
    content: '두산 팬 입장에선 조금 아쉬웠습니다',
    time: DateTime.now().subtract(const Duration(minutes: 50)),
  ),
  ChatMessage(
    id: 'm10',
    sender: mockUsers[3],
    content: '그래도 경기 자체는 재밌었어요',
    time: DateTime.now().subtract(const Duration(minutes: 49)),
  ),
  ChatMessage(
    id: 'm11',
    sender: mockUsers[3],
    content:
        '오늘 경기에서 투수 교체 타이밍이 정말 중요했다고 생각해요. '
        '특히 7회 말 상황에서 감독 판단이 승부를 갈랐다고 봐요. '
        '이런 경기 보면 야구가 진짜 데이터와 감각의 스포츠라는 게 느껴져요.',
    time: DateTime.now().subtract(const Duration(minutes: 45)),
  ),
  // ── 긴 글 (overflow 테스트)
  ChatMessage(
    id: 'm11',
    sender: currentUser,
    content:
        '저는 개인적으로 오늘 경기에서 투수 교체 타이밍이 정말 중요했다고 생각해요. '
        '특히 7회 말 상황에서 감독 판단이 승부를 갈랐다고 봐요. '
        '이런 경기 보면 야구가 진짜 데이터와 감각의 스포츠라는 게 느껴져요.',
    time: DateTime.now().subtract(const Duration(minutes: 45)),
  ),
  ChatMessage(
    id: 'm12',
    sender: currentUser,
    content: '요즘은 스트라이크 존도 안정돼서 타자들 플레이 보는 재미가 더 커진 느낌이에요.',
    time: DateTime.now().subtract(const Duration(minutes: 44)),
  ),
  ChatMessage(
    id: 'm122',
    sender: currentUser,
    content: '아 말하다보니 말이 길어졌네요 ㅋㅋ',
    time: DateTime.now().subtract(const Duration(minutes: 44)),
  ),

  // ── 태희
  ChatMessage(
    id: 'm13',
    sender: mockUsers[4],
    content: 'KT 요즘 분위기 좋지 않나요?',
    time: DateTime.now().subtract(const Duration(minutes: 40)),
  ),
  ChatMessage(
    id: 'm14',
    sender: mockUsers[4],
    content: '선발 로테이션이 진짜 안정적인 듯',
    time: DateTime.now().subtract(const Duration(minutes: 39)),
  ),

  // ── 팀 없는 유저
  ChatMessage(
    id: 'm15',
    sender: mockUsers[5],
    content: '저는 그냥 야구 자체를 좋아해요',
    time: DateTime.now().subtract(const Duration(minutes: 35)),
  ),

  // ── 최신 (내 메시지)
  ChatMessage(
    id: 'm16',
    sender: currentUser,
    content: '다음 주 경기 같이 보실 분?',
    time: DateTime.now().subtract(const Duration(minutes: 10)),
  ),
  ChatMessage(
    id: 'm17',
    sender: currentUser,
    content: '단체 관람도 재밌을 것 같아요',
    time: DateTime.now().subtract(const Duration(minutes: 9)),
  ),

  // ── 최신 답장
  ChatMessage(
    id: 'm18',
    sender: mockUsers[1],
    content: '오 좋죠!',
    time: DateTime.now().subtract(const Duration(minutes: 5)),
  ),
  ChatMessage(
    id: 'm19',
    sender: mockUsers[1],
    content: '일정 맞으면 꼭 갈게요',
    time: DateTime.now().subtract(const Duration(minutes: 4)),
  ),
  ChatMessage(
    id: 'm20',
    sender: mockUsers[2],
    content: '저도요 🙋‍♂️',
    time: DateTime.now().subtract(const Duration(minutes: 3)),
  ),
  ChatMessage(
    id: 'm11',
    sender: currentUser,
    content:
        '저는 개인적으로 오늘 경기에서 투수 교체 타이밍이 정말 중요했다고 생각해요. '
        '특히 7회 말 상황에서 감독 판단이 승부를 갈랐다고 봐요. '
        '이런 경기 보면 야구가 진짜 데이터와 감각의 스포츠라는 게 느껴져요.',
    time: DateTime.now().subtract(const Duration(minutes: 45)),
  ),
];
