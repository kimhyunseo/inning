import 'package:flutter/material.dart';
import 'package:inning/core/data/mock/match_mock.dart';
import 'package:inning/page/home/widgets/match_score_card.dart';
import 'package:inning/page/home/widgets/prediction_card.dart';
import 'package:inning/page/home/widgets/stadium_live_header.dart';

class InStadium extends StatelessWidget {
  const InStadium({super.key});

  @override
  Widget build(BuildContext context) {
    final currentMatch = mockGameMatches.firstWhere(
      (match) => match.stadium.id == 'stadium_incheon',
    );

    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 150),
      child: Column(
        children: [
          StadiumLiveHeader(stadium: currentMatch.stadium),
          SizedBox(height: 16),
          MatchScoreCard(match: currentMatch),
          PredictionCard(match: currentMatch),
        ],
      ),
    );
  }
}
