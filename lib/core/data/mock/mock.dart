// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class UploadTeamsPage extends StatelessWidget {
//   UploadTeamsPage({super.key});

//   final List<Map<String, String>> teams = [
//     {
//       "id": "lg",
//       "name": "엘지 트윈스",
//       "logoAsset": "assets/images/teams/lg_twins/logo.webp",
//       "emblemAsset": "assets/images/teams/lg_twins/emblem.webp",
//     },
//     {
//       "id": "doosan",
//       "name": "두산 베어스",
//       "logoAsset": "assets/images/teams/doosan_bears/logo.webp",
//       "emblemAsset": "assets/images/teams/doosan_bears/emblem.webp",
//     },
//     {
//       "id": "kiwoom",
//       "name": "키움 히어로즈",
//       "logoAsset": "assets/images/teams/kiwoom_heroes/logo.webp",
//       "emblemAsset": "assets/images/teams/kiwoom_heroes/emblem.webp",
//     },
//     {
//       "id": "ssg",
//       "name": "SSG 랜더스",
//       "logoAsset": "assets/images/teams/ssg_landers/logo.webp",
//       "emblemAsset": "assets/images/teams/ssg_landers/emblem.webp",
//     },
//     {
//       "id": "kt",
//       "name": "KT 위즈",
//       "logoAsset": "assets/images/teams/kt_wiz/logo.webp",
//       "emblemAsset": "assets/images/teams/kt_wiz/emblem.webp",
//     },
//     {
//       "id": "kia",
//       "name": "KIA 타이거즈",
//       "logoAsset": "assets/images/teams/kia_tigers/logo.webp",
//       "emblemAsset": "assets/images/teams/kia_tigers/emblem.webp",
//     },
//     {
//       "id": "samsung",
//       "name": "삼성 라이온즈",
//       "logoAsset": "assets/images/teams/samsung_lions/logo.webp",
//       "emblemAsset": "assets/images/teams/samsung_lions/emblem.webp",
//     },
//     {
//       "id": "lotte",
//       "name": "롯데 자이언츠",
//       "logoAsset": "assets/images/teams/lotte_giants/logo.webp",
//       "emblemAsset": "assets/images/teams/lotte_giants/emblem.webp",
//     },
//     {
//       "id": "nc",
//       "name": "NC 다이노스",
//       "logoAsset": "assets/images/teams/nc_dinos/logo.webp",
//       "emblemAsset": "assets/images/teams/nc_dinos/emblem.webp",
//     },
//     {
//       "id": "hanwha",
//       "name": "한화 이글스",
//       "logoAsset": "assets/images/teams/hanwha_eagles/logo.webp",
//       "emblemAsset": "assets/images/teams/hanwha_eagles/emblem.webp",
//     },
//   ];

//   Future<void> uploadTeams() async {
//     final firestore = FirebaseFirestore.instance;
//     for (var team in teams) {
//       await firestore
//           .collection('teams')
//           .doc(team['id'])
//           .set({
//             'name': team['name'],
//             'logoAsset': team['logoAsset'],
//             'emblemAsset': team['emblemAsset'],
//           })
//           .then((_) => print('✅ 업로드 완료: ${team['id']}'))
//           .catchError((e) => print('❌ 업로드 실패: ${team['id']} - $e'));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('팀 업로드')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             await uploadTeams();
//             ScaffoldMessenger.of(
//               context,
//             ).showSnackBar(const SnackBar(content: Text('모든 팀 업로드 완료!')));
//           },
//           child: const Text('팀 데이터 Firestore 업로드'),
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inning/core/model/chat_message.dart';
import 'package:inning/core/model/team.dart';
import 'package:inning/core/model/user.dart';

final List<ChatMessage> chatMockMessages = [
  ChatMessage(
    content: '오늘 잠실 직관 온 사람 있어요?',
    senderId: 'user_001',
    senderNickname: '현서',
    createdAt: DateTime.now(),
  ),
  ChatMessage(
    content: '저요! 3루 쪽 앉아있어요',
    senderId: 'user_002',
    senderNickname: '엘지팬92',
    createdAt: DateTime.now().add(const Duration(seconds: 1)),
  ),
  ChatMessage(
    content: '오늘 사람 진짜 많네요 ㄷㄷ',
    senderId: 'user_003',
    senderNickname: '야구는직관',
    createdAt: DateTime.now().add(const Duration(seconds: 2)),
  ),
  ChatMessage(
    content: '매점 줄 너무 길어요...',
    senderId: 'user_004',
    senderNickname: '치맥러버',
    createdAt: DateTime.now().add(const Duration(seconds: 3)),
  ),
  ChatMessage(
    content: '오늘 선발 컨디션 좋아 보이네요',
    senderId: 'user_005',
    senderNickname: '잠실러',
    createdAt: DateTime.now().add(const Duration(seconds: 4)),
  ),
  ChatMessage(
    content: '방금 타구 소리 미쳤다',
    senderId: 'user_002',
    senderNickname: '엘지팬92',
    createdAt: DateTime.now().add(const Duration(seconds: 5)),
  ),
  ChatMessage(
    content: '혹시 지금 몇 회에요?',
    senderId: 'user_006',
    senderNickname: '야구초보',
    createdAt: DateTime.now().add(const Duration(seconds: 6)),
  ),
  ChatMessage(
    content: '2회 말이에요!',
    senderId: 'user_003',
    senderNickname: '야구는직관',
    createdAt: DateTime.now().add(const Duration(seconds: 7)),
  ),
  ChatMessage(
    content: '오늘 이기면 불꽃놀이 한다던데요?',
    senderId: 'user_004',
    senderNickname: '치맥러버',
    createdAt: DateTime.now().add(const Duration(seconds: 8)),
  ),
  ChatMessage(
    content: '끝까지 봐야겠네요 🔥',
    senderId: 'user_001',
    senderNickname: '현서',
    createdAt: DateTime.now().add(const Duration(seconds: 9)),
  ),
];

Future<void> uploadChatMockMessages() async {
  final firestore = FirebaseFirestore.instance;
  final batch = firestore.batch();

  final messagesRef = firestore
      .collection('chatrooms')
      .doc('stadium_jamsil')
      .collection('messages');

  for (final message in chatMockMessages) {
    final docRef = messagesRef.doc();

    batch.set(docRef, {
      'content': message.content,
      'senderId': message.senderId,
      'senderNickname': message.senderNickname,
      'createdAt': message.createdAt.toIso8601String(),
    });
  }

  await batch.commit();
}

// class ChatMockUploadPage extends StatelessWidget {
//   const ChatMockUploadPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('채팅 목업 업로드')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             await uploadChatMockMessages();

//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('stadium_jamsil 채팅 목업 업로드 완료')),
//             );
//           },
//           child: const Text('잠실 채팅 목업 생성'),
//         ),
//       ),
//     );
//   }
// }

class ChatMockUploadPage extends StatefulWidget {
  const ChatMockUploadPage({super.key});

  @override
  State<ChatMockUploadPage> createState() => _ChatMockUploadPageState();
}

class _ChatMockUploadPageState extends State<ChatMockUploadPage> {
  bool _loading = false;

  /// 🔹 Firestore에서 팀 직접 가져오기
  Future<List<Team>> _fetchTeams() async {
    final snapshot = await FirebaseFirestore.instance.collection('teams').get();

    if (snapshot.docs.isEmpty) {
      throw Exception('teams 컬렉션이 비어 있습니다.');
    }

    return snapshot.docs
        .map((doc) => Team.fromJson({...doc.data(), 'id': doc.id}))
        .toList();
  }

  /// 🔹 유저 목 데이터 생성 (Team 객체 직접 사용)
  List<User> _createMockUsers(List<Team> teams) {
    Team findTeam(String id) =>
        teams.firstWhere((t) => t.id == id, orElse: () => teams.first);

    return [
      User(id: 'user_001', nickname: '현서', favoriteTeam: findTeam('ssg')),
      User(id: 'user_002', nickname: '엘지팬92', favoriteTeam: findTeam('lg')),
      User(id: 'user_003', nickname: '야구는직관', favoriteTeam: findTeam('kt')),
      User(id: 'user_004', nickname: '치맥러버', favoriteTeam: findTeam('doosan')),
      User(id: 'user_005', nickname: '잠실러', favoriteTeam: findTeam('lg')),
      User(id: 'user_006', nickname: '야구초보', favoriteTeam: null),
    ];
  }

  /// 🔹 채팅 목 데이터
  List<ChatMessage> _createMockMessages() {
    final now = DateTime.now();

    return [
      ChatMessage(
        content: '오늘 잠실 직관 온 사람 있어요?',
        senderId: 'user_001',
        senderNickname: '현서',
        createdAt: now,
      ),
      ChatMessage(
        content: '저요! 3루 쪽 앉아있어요',
        senderId: 'user_002',
        senderNickname: '엘지팬92',
        createdAt: now.add(const Duration(seconds: 1)),
      ),
      ChatMessage(
        content: '오늘 사람 진짜 많네요 ㄷㄷ',
        senderId: 'user_003',
        senderNickname: '야구는직관',
        createdAt: now.add(const Duration(seconds: 2)),
      ),
      ChatMessage(
        content: '매점 줄 너무 길어요...',
        senderId: 'user_004',
        senderNickname: '치맥러버',
        createdAt: now.add(const Duration(seconds: 3)),
      ),
      ChatMessage(
        content: '오늘 선발 컨디션 좋아 보이네요',
        senderId: 'user_005',
        senderNickname: '잠실러',
        createdAt: now.add(const Duration(seconds: 4)),
      ),
      ChatMessage(
        content: '끝까지 봐야겠네요 🔥',
        senderId: 'user_001',
        senderNickname: '현서',
        createdAt: now.add(const Duration(seconds: 5)),
      ),
    ];
  }

  /// 🔹 업로드 실행
  Future<void> _uploadMockData() async {
    setState(() => _loading = true);

    try {
      final firestore = FirebaseFirestore.instance;

      /// 1️⃣ 팀 fetch
      final teams = await _fetchTeams();

      /// 2️⃣ 유저 업로드
      final users = _createMockUsers(teams);
      for (final user in users) {
        await firestore.collection('user').doc(user.id).set(user.toJson());
      }

      /// 3️⃣ 채팅 업로드 (잠실 채팅방)
      final chatRoomRef = firestore
          .collection('chatrooms')
          .doc('stadium_jamsil');

      final messages = _createMockMessages();
      for (final msg in messages) {
        await chatRoomRef.collection('messages').add(msg.toJson());
      }

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('✅ 채팅 목 데이터 업로드 완료')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('❌ 업로드 실패: $e')));
      }
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('채팅 목 데이터 업로드')),
      body: Center(
        child: _loading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: _uploadMockData,
                child: const Text('🔥 채팅 목 데이터 업로드'),
              ),
      ),
    );
  }
}
