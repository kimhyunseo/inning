import 'package:inning/core/model/game_match.dart';
import 'package:inning/core/model/stadium.dart';
import 'package:inning/core/model/team.dart';

List<GameMatch> createFirebaseMockMatches(
  List<Stadium> stadiums,
  List<Team> teams,
) {
  if (stadiums.isEmpty || teams.isEmpty) return [];

  Team? findTeam(String id) =>
      teams.firstWhere((t) => t.id == id, orElse: () => teams[0]);

  Stadium findStadium(String id) =>
      stadiums.firstWhere((s) => s.id == id, orElse: () => stadiums[0]);

  return [
    GameMatch(
      homeTeam: findTeam('lg')!,
      awayTeam: findTeam('lotte')!,
      homeScore: 3,
      awayScore: 1,
      inning: 1,
      inningHalf: InningHalf.top,
      startTime: DateTime.now().subtract(const Duration(hours: 2)),
      stadium: findStadium('stadium_jamsil'),
    ),
    GameMatch(
      homeTeam: findTeam('ssg')!,
      awayTeam: findTeam('kiwoom')!,
      homeScore: 2,
      awayScore: 4,
      inning: 5,
      inningHalf: InningHalf.bottom,
      startTime: DateTime.now().subtract(const Duration(hours: 3)),
      stadium: findStadium('stadium_incheon'),
    ),
    GameMatch(
      homeTeam: findTeam('kia')!,
      awayTeam: findTeam('nc')!,
      homeScore: 0,
      awayScore: 1,
      inning: 7,
      inningHalf: InningHalf.top,
      startTime: DateTime.now().subtract(const Duration(hours: 1, minutes: 30)),
      stadium: findStadium('stadium_gwangju'),
    ),
    GameMatch(
      homeTeam: findTeam('kt')!,
      awayTeam: findTeam('doosan')!,
      homeScore: 5,
      awayScore: 3,
      inning: 9,
      inningHalf: InningHalf.bottom,
      startTime: DateTime.now().subtract(const Duration(hours: 4)),
      stadium: findStadium('stadium_suwon'),
    ),
    GameMatch(
      homeTeam: findTeam('samsung')!,
      awayTeam: findTeam('hanwha')!,
      homeScore: 1,
      awayScore: 2,
      inning: 3,
      inningHalf: InningHalf.top,
      startTime: DateTime.now().subtract(const Duration(hours: 5)),
      stadium: findStadium('stadium_daegu'),
    ),
  ];
}
