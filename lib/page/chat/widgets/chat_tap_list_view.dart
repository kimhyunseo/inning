import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/fonts.dart';
import 'package:inning/core/model/user.dart';
import 'package:inning/core/utils/user_util.dart';
import 'package:inning/core/widgets/loading_page.dart';
import 'package:inning/page/chat/chat_view_model.dart';
import 'package:inning/page/chat/widgets/my_message_widget.dart';
import 'package:inning/page/chat/widgets/other_messege_widget.dart';
import 'package:inning/page/home/team_view_model.dart';

class ChatTapListView extends ConsumerStatefulWidget {
  final String stadiumId;
  const ChatTapListView({super.key, required this.stadiumId});

  @override
  ConsumerState<ChatTapListView> createState() => _ChatTapListViewState();
}

class _ChatTapListViewState extends ConsumerState<ChatTapListView> {
  // 이제 발신자들(usersMap)은 ViewModel에서 관리하므로 내 정보(currentUser)만 관리합니다.
  User? currentUser;

  @override
  void initState() {
    super.initState();
    isMe();
  }

  Future<void> isMe() async {
    final user = await UserUtil.getCurrentUser();
    if (mounted) {
      setState(() {
        currentUser = user;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final teamState = ref.watch(teamViewModelProvider);
    final state = ref.watch(chatViewModelProvider);

    if (teamState.isLoading || state.isLoading) {
      return const LoadingPage();
    }

    if (state.messages.isEmpty) {
      return Center(
        child: Text(
          '현재 채팅방에 메시지가 없습니다',
          style: AppTextStyles.bodySecondary14w500.copyWith(
            color: AppColors.brandMain,
          ),
        ),
      );
    }

    final teamsMap = {for (var team in teamState.teams) team.id: team};
    final messages = state.messages;

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

          if (currentUser != null && message.senderId == currentUser!.id) {
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
              usersMap: state.usersMap,
              teamsMap: teamsMap,
            );
          }
        },
      ),
    );
  }
}
