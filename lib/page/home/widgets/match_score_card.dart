import 'package:flutter/material.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/app_shadow.dart';
import 'package:inning/core/fonts.dart';
import 'package:inning/page/home/widgets/inning_badge.dart';

class MatchScoreCard extends StatelessWidget {
  const MatchScoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [AppShadows.defaultShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _MatchHeader(),
          SizedBox(height: 16),
          _MatchScoreRow(),
        ],
      ),
    );
  }
}

class _MatchHeader extends StatelessWidget {
  const _MatchHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'KBO 정규시즌',
          style: AppTextStyles.bodyPrimary16w600.copyWith(
            color: AppColors.grey1,
          ),
        ),
        InningBadge(half: "말"),
      ],
    );
  }
}

class _MatchScoreRow extends StatelessWidget {
  const _MatchScoreRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        _TeamColumn(teamName: 'LG 트윈스', isHome: true),
        _ScoreText(homeScore: 3, awayScore: 1),
        _TeamColumn(teamName: '롯데 자이언츠', isHome: false),
      ],
    );
  }
}

class _TeamColumn extends StatelessWidget {
  final String teamName;
  final bool isHome;

  const _TeamColumn({required this.teamName, required this.isHome});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.brandPopUp,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: isHome ? AppColors.brandMain : AppColors.grey3,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            isHome ? 'Home' : 'Away',
            style: AppTextStyles.labelStatus12w500.copyWith(
              color: isHome ? AppColors.white : AppColors.grey1,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(teamName, style: AppTextStyles.bodyPrimary16w600),
      ],
    );
  }
}

class _ScoreText extends StatelessWidget {
  final int homeScore;
  final int awayScore;

  const _ScoreText({required this.homeScore, required this.awayScore});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$homeScore',
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w800,
            color: AppColors.brandPoint,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            ':',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: AppColors.brandPopUp,
            ),
          ),
        ),
        Text(
          '$awayScore',
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w800,
            color: AppColors.brandPoint,
          ),
        ),
      ],
    );
  }
}
