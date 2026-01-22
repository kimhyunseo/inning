import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/model/chat_message.dart';
import 'package:inning/core/repository/chat_repository.dart';

class ChatState {
  final List<ChatMessage> messages;
  final bool isLoading;

  const ChatState({this.messages = const [], this.isLoading = false});

  ChatState copyWith({List<ChatMessage>? messages, bool? isLoading}) {
    return ChatState(
      messages: messages ?? this.messages,
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

    final stream = repository.watchMessages(stadiumId);
    final streamSubScription = stream.listen((data) {
      state = state.copyWith(isLoading: false, messages: data);
    });

    ref.onDispose(() {
      streamSubScription.cancel();
    });
  }

  /// 메시지 전송
  Future<void> sendMessage(String stadiumId, ChatMessage message) async {
    await repository.sendMessage(stadiumId, message);
  }
}

/// Provider 정의
final chatViewModelProvider = NotifierProvider<ChatViewModel, ChatState>(() {
  return ChatViewModel();
});
