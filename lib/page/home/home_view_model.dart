import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 위치 상태
enum HomeLocationState { permissionRequired, outsideStadium, insideStadium }

/// 전체 상태
class HomeStateData {
  final HomeLocationState locationState;
  final int currentInning;

  HomeStateData({required this.locationState, required this.currentInning});
}

/// Notifier
class HomeNotifier extends Notifier<HomeStateData> {
  @override
  HomeStateData build() {
    return HomeStateData(
      locationState: HomeLocationState.permissionRequired,
      currentInning: 1,
    );
  }

  // 위치 상태 변경
  void setPermissionRequired() {
    state = HomeStateData(
      locationState: HomeLocationState.permissionRequired,
      currentInning: state.currentInning,
    );
  }

  void setOutsideStadium() {
    state = HomeStateData(
      locationState: HomeLocationState.outsideStadium,
      currentInning: state.currentInning,
    );
  }

  void setInsideStadium() {
    state = HomeStateData(
      locationState: HomeLocationState.insideStadium,
      currentInning: state.currentInning,
    );
  }
}

/// Provider
final homeViewModelProvider = NotifierProvider<HomeNotifier, HomeStateData>(
  () => HomeNotifier(),
);
