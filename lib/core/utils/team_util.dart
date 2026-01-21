import 'package:inning/core/data/mock/team_mock.dart';
import 'package:inning/core/model/team.dart';

Team? getTeamById(String? id) {
  if (id == null) return null;
  return mockTeams.firstWhere(
    (team) => team.id == id,
    orElse: () => mockTeams[0], // 기본값
  );
}
