import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/repository/vworld_repository.dart';

/// 위치 상태
enum HomeLocationState { permissionRequired, outsideStadium, insideStadium }

/// 전체 상태
class HomeStateData {
  final HomeLocationState locationState;
  final String? adress;
  // 주소 저장할 변수 추가

  HomeStateData({required this.locationState, this.adress});
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
    final locationService = LocationService();

    // 실제 Gps 팝업띄우고 주소 가져오기
    final String? district = await locationService.getCurrentDistrict();

    if (district != null && district != '위치 정보를 가져올 수 없습니다.') {
      // 성공 시 상태를 '안'으로 변경하고 주소 저장
      state = HomeStateData(
        locationState: HomeLocationState.insideStadium,
        adress: district,
      );
    } else {
      // 실패 시 다시 권한 필요상태
      state = HomeStateData(
        locationState: HomeLocationState.permissionRequired,
      );
    }
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
