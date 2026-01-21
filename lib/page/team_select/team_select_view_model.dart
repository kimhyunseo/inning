import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/data/mock/team_mock.dart';
import 'package:inning/core/model/team.dart';
import 'package:inning/core/repository/team_repository.dart';

class TeamSelectState {
  final List<Team> teams;
  final String? selectedTeamId;

  const TeamSelectState({required this.teams, this.selectedTeamId});

  TeamSelectState copyWith({List<Team>? teams, String? selectedTeamId}) {
    return TeamSelectState(
      teams: teams ?? this.teams,
      selectedTeamId: selectedTeamId,
    );
  }
}

class TeamSelectNotifier extends Notifier<TeamSelectState> {
  final TeamRepository repository = TeamRepository();

  @override
  TeamSelectState build() {
    loadTeams();
    return const TeamSelectState(teams: []);
  }

  /// Firebase에서 팀 데이터를 불러오는 함수
  Future<void> loadTeams() async {
    try {
      final teams = await repository.fetchTeams();
      state = state.copyWith(teams: teams);
    } catch (e) {
      state = state.copyWith(teams: []);
      print('팀 데이터 불러오기 실패: $e');
    }
  }

  void selectTeam(String teamId) {
    state = state.copyWith(selectedTeamId: teamId);
  }

  void selectNone() {
    state = state.copyWith(selectedTeamId: null);
  }
}

final teamSelectProvider =
    NotifierProvider<TeamSelectNotifier, TeamSelectState>(
      TeamSelectNotifier.new,
    );
