import 'package:inning/core/model/Stadium.dart';
import 'package:inning/core/model/team.dart';

enum InningHalf {
  top, // 초
  bottom, // 말
}

class GameMatch {
  final Team homeTeam;
  final Team awayTeam;
  final int homeScore;
  final int awayScore;
  final int inning; // 몇 회
  final InningHalf inningHalf; // "초" | "말"
  final DateTime startTime;
  final Stadium stadium;

  const GameMatch({
    required this.homeTeam,
    required this.awayTeam,
    required this.homeScore,
    required this.awayScore,
    required this.inning,
    required this.inningHalf,
    required this.startTime,
    required this.stadium,
  });
}
