import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/data/mock/team_mock.dart';
import 'package:inning/core/model/team.dart';
import 'package:inning/page/welcome/welcome_view_model.dart';

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
  @override
  TeamSelectState build() {
    return TeamSelectState(teams: mockTeams, selectedTeamId: null);
  }

  void selectTeam(String teamId) {
    state = state.copyWith(selectedTeamId: teamId);
  }

  void selectNone() {
    state = state.copyWith(selectedTeamId: null);
  }

  void confirmSelected() {
    final selectedId = state.selectedTeamId;

    final selectedTeam = selectedId != null
        ? state.teams.firstWhere((e) => e.id == selectedId)
        : null;

    ref.read(welcomeProvider.notifier).updateFavoriteTeam(selectedTeam);
  }
}

final teamSelectProvider =
    NotifierProvider<TeamSelectNotifier, TeamSelectState>(
      TeamSelectNotifier.new,
    );
