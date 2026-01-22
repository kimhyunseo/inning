import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/model/chat_message.dart';
import 'package:inning/core/model/user.dart';
import 'package:inning/core/repository/chat_repository.dart';
import 'package:inning/core/utils/user_util.dart';

class ChatState {
  final List<ChatMessage> messages;
  final Map<String, User> usersMap;
  final bool isLoading;

  const ChatState({
    this.messages = const [],
    this.usersMap = const {},
    this.isLoading = false,
  });

  ChatState copyWith({
    List<ChatMessage>? messages,
    Map<String, User>? usersMap,
    bool? isLoading,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      usersMap: usersMap ?? this.usersMap,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class ChatViewModel extends Notifier<ChatState> {
  @override
  ChatState build() {
    return const ChatState();
  }

  final ChatRepository repository = ChatRepository();

  // 어떤 채팅방을 구독할건지?
  void watchChat(String stadiumId) {
    state = state.copyWith(isLoading: true);

    final Stream<List<ChatMessage>> messageStream = repository.watchMessages(
      stadiumId,
    );

    final streamSubscription = messageStream.listen((
      List<ChatMessage> messages,
    ) async {
      final List<String> uniqueSenderIds = messages
          .map((message) => message.senderId)
          .toSet()
          .toList();

      // 유저 정보를 저장할 임시 맵(Map)을 생성
      final Map<String, User> userInformationMap = {};

      // 각 발신자 ID를 하나씩 순회하며 유저 정보를 서버에서 가져옴
      for (final String senderId in uniqueSenderIds) {
        // 이미 로드된 유저 정보가 state에 있다면 재사용
        if (state.usersMap.containsKey(senderId)) {
          userInformationMap[senderId] = state.usersMap[senderId]!;
          continue;
        }
        // UserUtil을 사용하여 Firestore에서 유저 객체를 가져옴
        final User? user = await UserUtil.getUserById(senderId);

        if (user != null) {
          // 유저 정보가 정상적으로 존재할 경우에만 맵에 추가
          userInformationMap[senderId] = user;
        }
      }

      state = state.copyWith(
        isLoading: false,
        messages: messages,
        usersMap: userInformationMap,
      );
    });

    ref.onDispose(() {
      streamSubscription.cancel();
    });
  }

  /// 메시지 전송
  Future<void> sendMessage({
    required String stadiumId,
    required String content,
  }) async {
    // SharedPreferences에서 유저 ID 가져오기
    final currentUser = await UserUtil.getCurrentUser();

    if (currentUser == null) {
      debugPrint("유저 정보가 없습니다. 메시지를 보낼 수 없습니다.");
      return;
    }
    final message = ChatMessage(
      content: content,
      senderId: currentUser.id,
      senderNickname: currentUser.nickname ?? '익명',
      createdAt: DateTime.now(),
    );

    await repository.sendMessage(stadiumId, message);
  }
}

/// Provider 정의
final chatViewModelProvider = NotifierProvider<ChatViewModel, ChatState>(() {
  return ChatViewModel();
});
