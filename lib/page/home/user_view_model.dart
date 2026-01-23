import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/model/user.dart';

// 홈뷰모델에서 사용하기 2
class UserState {
  final User? user;
  // 사용자가 인증되었는지를 나타내는 값 isAuthenticated
  final bool isAuthenticated;

  UserState({this.user, this.isAuthenticated = false});

  UserState copyWith({User? user, bool? isAuthenticated}) {
    return UserState(
      user: user ?? this.user,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}

class UserViewModel extends Notifier<UserState> {
  @override
  UserState build() => UserState();

  void login(User user) {
    state = state.copyWith(user: user, isAuthenticated: true);
  }

  void updateProfile(User updatedUser) {
    state = state.copyWith(user: updatedUser);
  }

  void logout() => state = UserState();
}

final userViewModelProvider = NotifierProvider<UserViewModel, UserState>(
  () => UserViewModel(),
);
