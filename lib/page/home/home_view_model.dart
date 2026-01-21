import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 위치 상태
enum HomeLocationState { permissionRequired, outsideStadium, insideStadium }

/// 전체 상태
class HomeStateData {
  final HomeLocationState locationState;

  HomeStateData({required this.locationState});
}

/// Notifier
class HomeNotifier extends Notifier<HomeStateData> {
  @override
  HomeStateData build() {
    return HomeStateData(locationState: HomeLocationState.permissionRequired);
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
