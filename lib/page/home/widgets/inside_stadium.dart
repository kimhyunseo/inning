import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/data/mock/match_mock.dart';
import 'package:inning/core/widgets/loading_page.dart';
import 'package:inning/page/home/stadium_view_model.dart';
import 'package:inning/page/home/team_view_model.dart';
import 'package:inning/page/home/widgets/match_score_card.dart';
import 'package:inning/page/home/widgets/prediction_card.dart';
import 'package:inning/page/home/widgets/stadium_live_header.dart';

class InStadium extends ConsumerStatefulWidget {
  const InStadium({super.key});

  @override
  ConsumerState<InStadium> createState() => _InStadiumState();
}

class _InStadiumState extends ConsumerState<InStadium> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(teamViewModelProvider.notifier).loadTeams();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final stadiumState = ref.watch(stadiumViewModelProvider);
    final teamState = ref.watch(teamViewModelProvider);

    final isDataNotReady =
        stadiumState.isLoading ||
        teamState.isLoading ||
        stadiumState.currentStadium == null ||
        teamState.teams.isEmpty;

    print('stadiumState.isLoading: ${stadiumState.isLoading}');
    print('teamState.isLoading: ${teamState.isLoading}');
    print('stadiumState.currentStadium: ${stadiumState.currentStadium}');
    print('teamState.teams: ${teamState.teams}');

    if (isDataNotReady) {
      return const LoadingPage();
    }

    final currentStadium = stadiumState.currentStadium!;
    final matches = createFirebaseMockMatches(
      stadiumState.stadiums,
      teamState.teams,
    );

    // 필터링된 경기 찾기
    final currentMatch = matches.firstWhere(
      (match) => match.stadium.id == currentStadium.id,
      orElse: () =>
          matches.isNotEmpty ? matches.first : throw Exception("No Match"),
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
