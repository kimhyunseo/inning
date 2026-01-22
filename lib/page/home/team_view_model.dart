import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/model/team.dart';
import 'package:inning/core/repository/team_repository.dart';

/// 팀 상태
class TeamState {
  final bool isLoading;
  final List<Team> teams;

  const TeamState({this.isLoading = false, this.teams = const []});

  TeamState copyWith({bool? isLoading, List<Team>? teams}) {
    return TeamState(
      isLoading: isLoading ?? this.isLoading,
      teams: teams ?? this.teams,
    );
  }
}

class TeamViewModel extends Notifier<TeamState> {
  @override
  TeamState build() {
    loadTeams();
    return const TeamState();
  }

  final TeamRepository repository = TeamRepository();

  /// 팀 데이터 로드
  Future<void> loadTeams() async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true);
    try {
      final teams = await repository.fetchTeams();
      state = state.copyWith(isLoading: false, teams: teams);
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }
}

/// Provider 정의
final teamViewModelProvider = NotifierProvider<TeamViewModel, TeamState>(() {
  return TeamViewModel();
});
