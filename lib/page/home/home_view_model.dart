import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/model/stadium.dart';
import 'package:inning/core/repository/vworld_repository.dart';
import 'package:inning/page/home/stadium_view_model.dart';

// 글로벌로케이션뷰모델로 기존 뷰모델 확장하기
/// 위치 상태
// 위치 요청시도 시 거부하거나 가져올 수 없는 형태 하나 더 추가
enum HomeLocationState {
  permissionRequired,
  outsideStadium,
  insideStadium,
  locationError,
}

/// 전체 상태
class GlobalLocationState {
  final HomeLocationState locationState;
  final String? district;
  // 로딩상태 추가
  final bool isLoading;

  GlobalLocationState({
    required this.locationState,
    this.district,
    this.isLoading = false,
  });

  GlobalLocationState copyWith({
    HomeLocationState? locationState,
    String? district,
    bool? isLoading,
  }) {
    return GlobalLocationState(
      locationState: locationState ?? this.locationState,
      district: district ?? this.district,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

/// Notifier
class GlobalLocationNotifier extends Notifier<GlobalLocationState> {
  GlobalLocationNotifier() : super();
  // 불변객체 수정
  @override
  GlobalLocationState build() {
    return GlobalLocationState(
      locationState: HomeLocationState.permissionRequired,
    );
  }

  // 실제 위치 요청, 주소 가져오는 함수. v월드 실행할 메서드
  Future<void> requestLocationAndAdress() async {
    // 로딩 시작. 작업 끝나면 false로!!
    state = state.copyWith(isLoading: true);

    try {
      // 브이월드로 현재 구 정보 가져오기
      final locationService = LocationService();
      // final String? district = '연희동'; )예시
      final String? currentDistrict = await locationService
          .getCurrentDistrict();

      // 1. 위치 정보 자체를 가져오지 못한 경우
      if (currentDistrict == null ||
          currentDistrict == '위치 정보를 가져올 수 없습니다.' ||
          currentDistrict == '알 수 없음') {
        state = state.copyWith(
          locationState: HomeLocationState.locationError,
          district: currentDistrict,
          isLoading: false,
        );
      }
      // else {
      //   state = state.copyWith(
      //     locationState: HomeLocationState.permissionRequired,
      //     isLoading: false,
      //   );
      //   // 실패시 종료
      //   return;
      // }
      // 주소 획득 성공 상태
      // 2. 스타디움뷰모델 데이터 참조해서 현재 위치가 경기장 리스트 안인지 확인
      final stadiumState = ref.read(stadiumViewModelProvider);

      // 리스트에서 조건에 맞는 첫번째 경기장 찾기
      final Stadium matchedStadium = stadiumState.stadiums.firstWhere(
        (s) =>
            s.district.contains(currentDistrict!) ||
            s.name.contains(currentDistrict),
        orElse: () => const Stadium(
          // 아이디를 빈 문자열로 주어야 나중에 비어있는지 체크가 정확하다. 공백은 true를 반환
          id: '',
          name: '',
          imageAsset: '',
          latitude: 0,
          longitude: 0,
          district: '',
        ),
      );

      // 매칭에 따른 상태 업데이트
      if (matchedStadium.id.isNotEmpty) {
        ref
            .read(stadiumViewModelProvider.notifier)
            .setCurrentStadium(matchedStadium);
        state = state.copyWith(
          locationState: HomeLocationState.insideStadium,
          isLoading: false,
        );
      } else {
        // 경기장 밖
        state = state.copyWith(
          locationState: HomeLocationState.outsideStadium,
          isLoading: false,
        );
      }
    } catch (e) {
      // 에러발생 시 종료
      state = state.copyWith(
        locationState: HomeLocationState.locationError,
        isLoading: false,
      );
    }
  }

  // 위치 단순 상태 변경. 카피위드를 사용하면 기존 디스트릭트 유지에 유리하다.
  void setPermissionRequired() {
    state = state.copyWith(locationState: HomeLocationState.permissionRequired);
  }

  void setOutsideStadium() {
    state = state.copyWith(locationState: HomeLocationState.outsideStadium);
  }

  void setInsideStadium() {
    state = state.copyWith(locationState: HomeLocationState.insideStadium);
  }
}

/// Provider
final homeViewModelProvider =
    NotifierProvider<GlobalLocationNotifier, GlobalLocationState>(
      () => GlobalLocationNotifier(),
    );
