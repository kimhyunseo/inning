import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/data/mock/chat_mock.dart';

import 'package:inning/core/data/mock/user_mock.dart';
import 'package:inning/page/chat/widgets/my_message_widget.dart';
import 'package:inning/page/chat/widgets/other_messege_widget.dart';
import 'package:inning/page/home/team_view_model.dart';

class ChatTapListView extends ConsumerWidget {
  const ChatTapListView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teamState = ref.watch(teamViewModelProvider);

    if (teamState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    final users = createMockUsers(teamState.teams);
    final usersMap = {for (var user in users) user.id: user};
    // TODO: id 바꿔줘서 나인지 바꾸기
    final currentUser = users.firstWhere((u) => u.id == 'user1');

    final messages = createMockMessages(users, currentUser);

    final teamsMap = {for (var team in teamState.teams) team.id: team};

    return Padding(
      padding: const EdgeInsets.only(right: 12, left: 12),
      child: ListView.builder(
        reverse: true,
        itemCount: messages.length,

        itemBuilder: (context, index) {
          final reversedIndex = messages.length - 1 - index;
          final message = messages[reversedIndex];

          final isFirstInGroup =
              reversedIndex == 0 ||
              messages[reversedIndex - 1].senderId != message.senderId;

          final isLastInGroup =
              reversedIndex == messages.length - 1 ||
              messages[reversedIndex + 1].senderId != message.senderId;

          if (message.senderId == currentUser.id) {
            return MyMessageWidget(
              message: message,
              isFirstInGroup: isFirstInGroup,
              isLastInGroup: isLastInGroup,
            );
          } else {
            return OtherMessageWidget(
              message: message,
              isFirstInGroup: isFirstInGroup,
              isLastInGroup: isLastInGroup,
              usersMap: usersMap,
              teamsMap: teamsMap,
            );
          }
        },
      ),
    );
  }
}
