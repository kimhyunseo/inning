import 'package:flutter/material.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/app_shadow.dart';
import 'package:inning/core/fonts.dart';
import 'package:inning/core/model/game_match.dart';
import 'package:inning/core/model/team.dart';
import 'package:inning/page/home/widgets/inning_badge.dart';

class MatchScoreCard extends StatelessWidget {
  final GameMatch match;

  const MatchScoreCard({super.key, required this.match});

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
        children: [
          _MatchHeader(inning: match.inning, inningHalf: match.inningHalf),
          SizedBox(height: 16),
          _MatchScoreRow(match: match),
        ],
      ),
    );
  }
}

class _MatchHeader extends StatelessWidget {
  final InningHalf inningHalf;
  final int inning;

  const _MatchHeader({required this.inning, required this.inningHalf});

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
        InningBadge(
          inning: inning,
          half: inningHalf == InningHalf.top ? "초" : "말",
        ),
      ],
    );
  }
}

class _MatchScoreRow extends StatelessWidget {
  final GameMatch match;

  const _MatchScoreRow({required this.match});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _TeamColumn(team: match.homeTeam, isHome: true),
        _ScoreText(homeScore: match.homeScore, awayScore: match.awayScore),
        _TeamColumn(team: match.awayTeam, isHome: false),
      ],
    );
  }
}

class _TeamColumn extends StatelessWidget {
  final Team team;
  final bool isHome;

  const _TeamColumn({required this.team, required this.isHome});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          team.emblemAsset,
          width: 100,
          height: 80,
          fit: BoxFit.contain,
        ),
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
        Text(team.name, style: AppTextStyles.bodyPrimary16w600),
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
