import 'package:flutter/material.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/fonts.dart';
import 'package:inning/core/model/Stadium.dart';

class StadiumLiveHeader extends StatelessWidget {
  final Stadium stadium;

  const StadiumLiveHeader({super.key, required this.stadium});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Stack(
        children: [
          /// background image
          Positioned.fill(
            child: Image.asset(
              stadium.imageAsset,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),

          /// gradient overlay (상단 투명 → 하단 어두움)
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.8),
                  ],
                ),
              ),
            ),
          ),

          /// live info
          Positioned(
            left: 24,
            bottom: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _LiveMatchBadge(),
                SizedBox(height: 4),
                Text(
                  stadium.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Pretendard',
                  ),
                ),
                SizedBox(height: 4),
                _LiveChatInfo(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LiveMatchBadge extends StatelessWidget {
  const _LiveMatchBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.success.withValues(alpha: 0.4),
                ),
              ),
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.success,
                ),
              ),
            ],
          ),
          const SizedBox(width: 6),
          Text(
            'LIVE MATCH',
            style: AppTextStyles.labelStatus12w500.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _LiveChatInfo extends StatelessWidget {
  const _LiveChatInfo();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.chat_bubble_outline_rounded,
          size: 12,
          color: AppColors.grey4,
        ),
        SizedBox(width: 4),
        RichText(
          text: TextSpan(
            style: AppTextStyles.labelStatus12w500.copyWith(
              color: AppColors.grey4,
            ),
            children: [
              TextSpan(text: '현재 '),
              TextSpan(
                text: '1,247명',
                style: TextStyle(color: AppColors.success),
              ),
              TextSpan(text: '이 채팅중'),
            ],
          ),
        ),
      ],
    );
  }
}
