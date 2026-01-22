import 'package:flutter/material.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/fonts.dart';
import 'package:inning/core/model/chat_message.dart';
import 'package:inning/core/model/team.dart';
import 'package:inning/core/model/user.dart';
import 'package:inning/core/utils/time_util.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class OtherMessageWidget extends StatelessWidget {
  final ChatMessage message;
  final bool isFirstInGroup;
  final bool isLastInGroup;
  final Map<String, User> usersMap; // 유저 정보
  final Map<String, Team> teamsMap; // 팀 정보

  const OtherMessageWidget({
    super.key,
    required this.message,
    required this.isFirstInGroup,
    required this.isLastInGroup,
    required this.usersMap,
    required this.teamsMap,
  });

  @override
  Widget build(BuildContext context) {
    //
    final sender = usersMap[message.senderId];
    final team = sender?.favoriteTeam != null
        ? teamsMap[sender!.favoriteTeam!.id]
        : null;

    return Padding(
      padding: EdgeInsets.only(left: 3, bottom: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isFirstInGroup)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.brandHintText,
                    backgroundImage: sender?.profileImage != null
                        ? AssetImage(sender!.profileImage!)
                        : null,
                    child: sender?.profileImage == null
                        ? Icon(
                            Icons.person,
                            size: 40,
                            color: AppColors.brandPoint,
                          )
                        : null,
                  ),
                  if (team?.logoAsset != null)
                    Positioned(
                      top: -3,
                      left: -3,
                      child: CircleAvatar(
                        radius: 11,
                        backgroundColor: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: ClipOval(
                            child: Image.asset(
                              team!.logoAsset,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            )
          else
            const SizedBox(width: 50),

          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isFirstInGroup)
                  Padding(
                    padding: const EdgeInsets.only(left: 16, bottom: 4),
                    child: Text(
                      message.senderNickname,
                      style: AppTextStyles.labelStatus12w500.copyWith(
                        color: AppColors.grey1,
                      ),
                    ),
                  ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    BubbleSpecialOne(
                      text: message.content,
                      color: AppColors.white,
                      tail: isFirstInGroup,
                      isSender: false,
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.55,
                      ),
                      textStyle: AppTextStyles.bodySecondary14w500.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    if (isLastInGroup)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2, right: 4),
                        child: Text(
                          formatTime(message.createdAt),
                          style: AppTextStyles.labelChat10w500.copyWith(
                            color: AppColors.brandHintText,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
