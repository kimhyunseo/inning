import 'package:flutter/material.dart';
import 'package:inning/core/data/mock/chat_mock.dart';
import 'package:inning/core/data/mock/user_mock.dart';
import 'package:inning/page/chat/widgets/my_message_widget.dart';
import 'package:inning/page/chat/widgets/other_messege_widget.dart';

class ChatTapListView extends StatefulWidget {
  const ChatTapListView({super.key});

  @override
  State<ChatTapListView> createState() => _ChatTapListViewState();
}

class _ChatTapListViewState extends State<ChatTapListView> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ListView.builder(
        controller: scrollController,
        reverse: true,
        itemCount: mockMessages.length,

        itemBuilder: (context, index) {
          final reversedIndex = mockMessages.length - 1 - index;
          final message = mockMessages[reversedIndex];

          final isFirstInGroup =
              reversedIndex == 0 ||
              mockMessages[reversedIndex - 1].sender.id != message.sender.id;

          final isLastInGroup =
              reversedIndex == mockMessages.length - 1 ||
              mockMessages[reversedIndex + 1].sender.id != message.sender.id;

          if (message.sender.id == currentUser.id) {
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
            );
          }
        },
      ),
    );
  }
}
