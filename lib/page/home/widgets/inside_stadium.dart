import 'package:flutter/material.dart';
import 'package:inning/page/home/widgets/match_score_card.dart';
import 'package:inning/page/home/widgets/prediction_card.dart';
import 'package:inning/page/home/widgets/stadium_live_header.dart';

class InStadium extends StatelessWidget {
  const InStadium({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 150),
          child: Column(
            children: const [
              StadiumLiveHeader(),
              SizedBox(height: 16),
              MatchScoreCard(),
              PredictionCard(),
            ],
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: 16,
          child: SafeArea(
            child: ElevatedButton(onPressed: () {}, child: const Text("입장하기")),
          ),
        ),
      ],
    );
  }
}
