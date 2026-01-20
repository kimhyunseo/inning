// 홈 화면용 단일 mock 경기
import 'package:inning/core/data/mock/stadiums_mock.dart';
import 'package:inning/core/data/mock/team_mock.dart';
import 'package:inning/core/model/game_match.dart';

final mockGameMatches = [
  GameMatch(
    homeTeam: mockTeams.firstWhere((t) => t.id == 'lg'),
    awayTeam: mockTeams.firstWhere((t) => t.id == 'lotte'),
    homeScore: 3,
    awayScore: 1,
    inning: 1,
    inningHalf: InningHalf.top,
    startTime: DateTime.now().subtract(const Duration(hours: 2)),
    stadium: mockStadiums.firstWhere((s) => s.id == 'stadium_jamsil'),
  ),
  GameMatch(
    homeTeam: mockTeams.firstWhere((t) => t.id == 'ssg'),
    awayTeam: mockTeams.firstWhere((t) => t.id == 'kt'),
    homeScore: 2,
    awayScore: 4,
    inning: 5,
    inningHalf: InningHalf.bottom,
    startTime: DateTime.now().subtract(const Duration(hours: 3)),
    stadium: mockStadiums.firstWhere((s) => s.id == 'stadium_incheon'),
  ),
  GameMatch(
    homeTeam: mockTeams.firstWhere((t) => t.id == 'kia'),
    awayTeam: mockTeams.firstWhere((t) => t.id == 'nc'),
    homeScore: 0,
    awayScore: 1,
    inning: 7,
    inningHalf: InningHalf.top,
    startTime: DateTime.now().subtract(const Duration(hours: 1, minutes: 30)),
    stadium: mockStadiums.firstWhere((s) => s.id == 'stadium_gwangju'),
  ),
  GameMatch(
    homeTeam: mockTeams.firstWhere((t) => t.id == 'kt'),
    awayTeam: mockTeams.firstWhere((t) => t.id == 'lg'),
    homeScore: 5,
    awayScore: 3,
    inning: 9,
    inningHalf: InningHalf.bottom,
    startTime: DateTime.now().subtract(const Duration(hours: 4)),
    stadium: mockStadiums.firstWhere((s) => s.id == 'stadium_suwon'),
  ),
  GameMatch(
    homeTeam: mockTeams.firstWhere((t) => t.id == 'ssg'),
    awayTeam: mockTeams.firstWhere((t) => t.id == 'kia'),
    homeScore: 1,
    awayScore: 2,
    inning: 3,
    inningHalf: InningHalf.top,
    startTime: DateTime.now().subtract(const Duration(hours: 5)),
    stadium: mockStadiums.firstWhere((s) => s.id == 'stadium_incheon'),
  ),
];
