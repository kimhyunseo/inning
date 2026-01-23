import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/repository/vworld_repository.dart';

// 홈뷰모델에서 사용하기 1
// 전역 위치상태 관리. 구, 시 위치정보만 가지고 있는 모델. 위도 경도 좌표, V월드 주소변환 전담
// 1. 상태클래스
class GlobalLocationState {
  final double? lat;
  final double? lng;
  final String? district;
  final bool isLoading;

  GlobalLocationState({
    this.lat,
    this.lng,
    this.district,
    this.isLoading = false,
  });

  GlobalLocationState copyWith({
    double? lat,
    double? lng,
    String? district,
    bool? isLoading,
  }) {
    return GlobalLocationState(
      lat: lat ?? this.lat,
      lng: lng ?? this.lat,
      district: district ?? this.district,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

// 2. 뷰모델. 야구장 안, 밖 인지?
class GloverLocationViewModel extends Notifier<GlobalLocationState> {
  @override
  GlobalLocationState build() => GlobalLocationState();

  // V월드 연동
  Future<void> refreshLocation() async {
    state = state.copyWith(isLoading: true);
    try {
      // GPS 좌표 얻기 예시
      const lat = 37.548;
      const lng = 126.678;

      // v월드 레포지토리 호출하기
      final vworldRepo = VworldRepository();
      final district = await vworldRepo.findByLatLog(lat, lng);

      state = state.copyWith(
        lat: lat,
        lng: lng,
        // 타입이 다름. 뒤에는 리스트 타입
        district: district[0],
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }
}

final globalLocationViewModelProvider =
    NotifierProvider<GloverLocationViewModel, GlobalLocationState>(
      () => GloverLocationViewModel(),
    );
