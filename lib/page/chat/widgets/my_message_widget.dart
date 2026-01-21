import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/fonts.dart';
import 'package:inning/core/model/chat_message.dart';
import 'package:inning/core/utils/time_util.dart';

class MyMessageWidget extends StatelessWidget {
  final ChatMessage message;
  final bool isFirstInGroup;
  final bool isLastInGroup;

  const MyMessageWidget({
    super.key,
    required this.message,
    required this.isFirstInGroup,
    required this.isLastInGroup,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: isFirstInGroup ? 8 : 2,
        bottom: isLastInGroup ? 8 : 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (isLastInGroup)
            Padding(
              padding: const EdgeInsets.only(bottom: 2, left: 4),
              child: Text(
                formatTime(message.time),
                style: AppTextStyles.labelChat10w500.copyWith(
                  color: AppColors.brandHintText,
                ),
              ),
            ),
          BubbleSpecialThree(
            text: message.content,
            color: AppColors.warning,
            tail: isFirstInGroup,
            textStyle: AppTextStyles.bodySecondary14w500.copyWith(
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
