import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/data/mock/user_mock.dart';
import 'package:inning/core/fonts.dart';
import 'package:inning/core/widgets/loading_page.dart';
import 'package:inning/page/chat/chat_view_model.dart';
import 'package:inning/page/chat/widgets/my_message_widget.dart';
import 'package:inning/page/chat/widgets/other_messege_widget.dart';
import 'package:inning/page/home/team_view_model.dart';

class ChatTapListView extends ConsumerWidget {
  final String stadiumId;
  const ChatTapListView({super.key, required this.stadiumId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teamState = ref.watch(teamViewModelProvider);
    final state = ref.watch(chatViewModelProvider);

    if (teamState.isLoading) {
      return const LoadingPage();
    }

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
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
    //  팀 정보를 Map으로 만들어 가공 (기존 로직 유지)
    final teamsMap = {for (var team in teamState.teams) team.id: team};
    final users = createMockUsers(teamState.teams);
    final usersMap = {for (var user in users) user.id: user};

    // TODO: 실제 로그인된 유저 정보를 가져오도록 추후 변경 (지금은 Mock)
    final currentUser = users.firstWhere((u) => u.id == 'user1');

    // 해당 구장에 맞는 메세지만 가져오도록 필터링
    // 지금은 mock이라 전체 메세지를 가져온 뒤 stadiumId로 filter
    final messages = state.messages;
    (users, currentUser, stadiumId);

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
