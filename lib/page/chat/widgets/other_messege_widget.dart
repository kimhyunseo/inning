import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/fonts.dart';
import 'package:inning/core/model/chat_message.dart';
import 'package:inning/core/utils/team_util.dart';
import 'package:inning/core/utils/time_util.dart';

class OtherMessageWidget extends StatelessWidget {
  final ChatMessage message;
  final bool isFirstInGroup;
  final bool isLastInGroup;

  const OtherMessageWidget({
    super.key,
    required this.message,
    required this.isFirstInGroup,
    required this.isLastInGroup,
  });

  @override
  Widget build(BuildContext context) {
    final team = getTeamById(message.sender.favoriteTeam);
    return Padding(
      padding: EdgeInsets.only(
        left: 3,
        top: isFirstInGroup ? 8 : 0,
        bottom: isLastInGroup ? 8 : 0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: isFirstInGroup,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.brandHintText,
                  backgroundImage: message.sender.profileImage != null
                      ? AssetImage(message.sender.profileImage!)
                      : null,
                  child: message.sender.profileImage == null
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
          ),

          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isFirstInGroup)
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      message.sender.nickname ?? '익명',
                      style: AppTextStyles.labelStatus12w500.copyWith(
                        color: AppColors.grey1,
                      ),
                    ),
                  ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    BubbleSpecialThree(
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
                          formatTime(message.time),
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
