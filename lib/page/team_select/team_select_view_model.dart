import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/data/mock/team_mock.dart';
import 'package:inning/core/model/team.dart';

enum TeamSelectType { team, none }

class TeamSelectState {
  final List<Team> teams;
  final TeamSelectType type;
  final String? selectedTeamId;

  const TeamSelectState({
    required this.teams,
    required this.type,
    this.selectedTeamId,
  });

  TeamSelectState copyWith({
    List<Team>? teams,
    TeamSelectType? type,
    String? selectedTeamId,
  }) {
    return TeamSelectState(
      teams: teams ?? this.teams,
      type: type ?? this.type,
      selectedTeamId: selectedTeamId,
    );
  }
}

final teamSelectViewModelProvider =
    NotifierProvider<TeamSelectViewModel, TeamSelectState>(
      TeamSelectViewModel.new,
    );

class TeamSelectViewModel extends Notifier<TeamSelectState> {
  @override
  TeamSelectState build() {
    return TeamSelectState(
      teams: mockTeams,
      type: TeamSelectType.none,
      selectedTeamId: null,
    );
  }

  void selectNone() {
    state = state.copyWith(type: TeamSelectType.none, selectedTeamId: null);
  }

  void selectTeam(String teamId) {
    state = state.copyWith(type: TeamSelectType.team, selectedTeamId: teamId);
  }
}
