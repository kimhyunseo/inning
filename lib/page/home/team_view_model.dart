import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/model/team.dart';
import 'package:inning/core/repository/team_repository.dart';

/// 팀 상태
class TeamState {
  final bool isLoading;
  final List<Team> teams;
  final String? error;

  const TeamState({this.isLoading = false, this.teams = const [], this.error});

  TeamState copyWith({bool? isLoading, List<Team>? teams, String? error}) {
    return TeamState(
      isLoading: isLoading ?? this.isLoading,
      teams: teams ?? this.teams,
      error: error,
    );
  }
}

class TeamNotifier extends Notifier<TeamState> {
  final TeamRepository repository;

  TeamNotifier({required this.repository});

  @override
  TeamState build() {
    return const TeamState();
  }

  /// 팀 데이터 로드
  Future<void> loadTeams() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final teams = await repository.fetchTeams();
      state = state.copyWith(isLoading: false, teams: teams);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

/// Provider 정의
final teamViewModelProvider = NotifierProvider<TeamNotifier, TeamState>(() {
  final repository = TeamRepository();
  return TeamNotifier(repository: repository);
});
