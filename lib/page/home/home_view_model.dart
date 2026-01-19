import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:inning/core/app_color.dart';

/// 위치 상태
enum HomeLocationState { permissionRequired, outsideStadium, insideStadium }

/// 이닝 단계
enum InningPhase { early, middle, late }

InningPhase getInningPhase(int inning) {
  if (inning <= 3) return InningPhase.early;
  if (inning <= 6) return InningPhase.middle;
  return InningPhase.late;
}

Color inningColor(InningPhase phase) {
  switch (phase) {
    case InningPhase.early:
      return Colors.green;
    case InningPhase.middle:
      return AppColors.warning;
    case InningPhase.late:
      return AppColors.error;
  }
}

/// 전체 상태
class HomeStateData {
  final HomeLocationState locationState;
  final int currentInning;

  HomeStateData({required this.locationState, required this.currentInning});

  InningPhase get inningPhase => getInningPhase(currentInning);
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

  // 이닝 변경
  void setInning(int inning) {
    state = HomeStateData(
      locationState: state.locationState,
      currentInning: inning,
    );
  }
}

/// Provider
final homeViewModelProvider = NotifierProvider<HomeNotifier, HomeStateData>(
  () => HomeNotifier(),
);
