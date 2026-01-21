import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/model/stadium.dart';
import 'package:inning/core/repository/stadium_repository.dart';

/// 상태
class StadiumState {
  final List<Stadium> stadiums;
  final Stadium? currentStadium;
  final bool isLoading;

  const StadiumState({
    required this.stadiums,
    this.currentStadium,
    this.isLoading = false,
  });

  StadiumState copyWith({
    List<Stadium>? stadiums,
    Stadium? currentStadium,
    bool? isLoading,
  }) {
    return StadiumState(
      stadiums: stadiums ?? this.stadiums,
      currentStadium: currentStadium ?? this.currentStadium,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

/// ViewModel
class StadiumViewModel extends Notifier<StadiumState> {
  final StadiumRepository repository;

  StadiumViewModel({StadiumRepository? repository})
    : repository = repository ?? StadiumRepository();

  @override
  StadiumState build() {
    // 초기 상태만 설정
    return const StadiumState(
      stadiums: [],
      currentStadium: null,
      isLoading: false,
    );
  }

  /// 전체 경기장 가져오기
  Future<void> loadStadiums() async {
    state = state.copyWith(isLoading: true);

    try {
      final stadiums = await repository.fetchStadiums();

      // 첫 번째 경기장을 기본 currentStadium으로 설정
      final initialStadium = stadiums.isNotEmpty ? stadiums[0] : null;

      state = state.copyWith(
        stadiums: stadiums,
        currentStadium: initialStadium,
        isLoading: false,
      );
    } catch (e) {
      print("❌ 경기장 가져오기 실패: $e");
      state = state.copyWith(isLoading: false);
    }
  }

  /// 현재 경기장 설정
  void setCurrentStadium(Stadium stadium) {
    state = state.copyWith(currentStadium: stadium);
  }

  /// ID로 현재 경기장 설정
  Future<void> setCurrentStadiumById(String id) async {
    final stadium = await repository.fetchStadiumById(id);
    if (stadium != null) setCurrentStadium(stadium);
  }
}

/// Provider
final stadiumViewModelProvider =
    NotifierProvider<StadiumViewModel, StadiumState>(() => StadiumViewModel());
