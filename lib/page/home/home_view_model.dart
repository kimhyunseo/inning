import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/model/stadium.dart';
import 'package:inning/core/repository/vworld_repository.dart';
import 'package:inning/page/home/stadium_view_model.dart';

/// 위치 상태
// 위치 요청시도 시 거부하거나 가져올 수 없는 형태 하나 더 추가
enum HomeLocationState {
  permissionRequired,
  outsideStadium,
  insideStadium,
  locationError,
}

/// 전체 상태
class HomeStateData {
  final HomeLocationState locationState;
  final String? adress;
  // 로딩상태 추가
  final bool isLoading;

  HomeStateData({
    required this.locationState,
    this.adress,
    this.isLoading = false,
  });

  HomeStateData copyWith({
    HomeLocationState? locationState,
    String? adress,
    bool? isLoading,
  }) {
    return HomeStateData(
      locationState: locationState ?? this.locationState,
      adress: adress ?? this.adress,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

/// Notifier
class HomeNotifier extends Notifier<HomeStateData> {
  HomeNotifier() : super();
  // 불변객체 수정
  @override
  HomeStateData build() {
    return HomeStateData(locationState: HomeLocationState.permissionRequired);
  }

  // 실제 위치 요청, 주소 가져오는 함수. v월드 실행할 메서드
  Future<void> requestLocationAndAdress() async {
    // 로딩 시작. 작업 끝나면 false로!!
    state = state.copyWith(isLoading: true);

    try {
      final locationService = LocationService();
      final String? district = await locationService.getCurrentDistrict();

      // 1. 위치 정보 자체를 가져오지 못한 경우
      if (district == null || district == '위치 정보를 가져올 수 없습니다.') {
        state = state.copyWith(
          locationState: HomeLocationState.locationError,
          adress: district,
          isLoading: false,
        );
      } else {
        state = state.copyWith(
          locationState: HomeLocationState.permissionRequired,
          isLoading: false,
        );
      }
    } catch (e) {
      // 에러발생 시 종료
      state = state.copyWith(isLoading: false);
    }

    // 2. 스타디움뷰모델 데이터 참조해서 현재 위치가 경기장 리스트 안인지 확인
    // final stadiumState = ref.read(stadiumViewModelProvider);

    // 리스트에서 조건에 맞는 첫번째 경기장 찾기. try문 위쪽으로 빼기
    // final Stadium matchedStadium = stadiumState.stadiums.firstWhere(
    //   (s) => s.address.contains(district) || s.name.contains(district),
    //   orElse: () => const Stadium(
    //     id: ' ',
    //     name: ' ',
    //     imageAsset: ' ',
    //     latitude: 0,
    //     longitude: 0,
    //   ),
    // );

    // // 매칭에 따른 상태 업데이트
    // if (matchedStadium.id.isNotEmpty) {
    //   ref
    //       .read(stadiumViewModelProvider.notifier)
    //       .setCurrentStadium(matchedStadium);
    //   state = state.copyWith(
    //     locationState: HomeLocationState.insideStadium,
    //     adress: district,
    //     isLoading: false,
    //   );
    // } else {
    //   // 경기장 밖
    //   state = state.copyWith(
    //     locationState: HomeLocationState.outsideStadium,
    //     adress: district,
    //     isLoading: false,
    //   );
    // }

    // 설정 화면으로 상태 변경
    // void setLocationError() {
    //   state = HomeStateData(locationState: HomeLocationState.locationError);
    // }
  }

  // 위치 상태 변경
  void setPermissionRequired() {
    state = HomeStateData(locationState: HomeLocationState.permissionRequired);
  }

  void setOutsideStadium() {
    state = HomeStateData(locationState: HomeLocationState.outsideStadium);
  }

  void setInsideStadium() {
    state = HomeStateData(locationState: HomeLocationState.insideStadium);
  }
}

/// Provider
final homeViewModelProvider = NotifierProvider<HomeNotifier, HomeStateData>(
  () => HomeNotifier(),
);
