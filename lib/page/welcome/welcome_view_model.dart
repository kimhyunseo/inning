import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/model/team.dart';
import 'package:inning/core/model/user.dart';
import 'package:inning/core/repository/user_repository.dart';
import 'package:uuid/uuid.dart';

class WelcomeState {
  //
}

class WelcomeViewModel extends Notifier<User> {
  //
  @override
  User build() {
    return User(id: '', nickname: '', favoriteTeam: null); //
  }

  // 상태 업데이트
  void updateNickname(String nickname) {
    state = User(
      id: state.id,
      nickname: nickname,
      favoriteTeam: state.favoriteTeam,
    );
  }

  // 상태 업데이트
  void updateFavoriteTeam(Team? favoriteTeam) {
    state = User(
      id: state.id,
      nickname: state.nickname,
      favoriteTeam: favoriteTeam,
    );
  }

  // 저장 (로컬 + 파이어베이스)
  Future<void> registerUser() async {
    if (state.nickname == null || state.nickname!.isEmpty) return;
    try {
      final repository = UserRepository();
      await repository.registerUser(state);
      print('회원가입 프로세스 완료');
    } catch (e) {
      print('뷰모델 저장에러 ${e}');
    }
  }
}

final welcomeProvider = NotifierProvider<WelcomeViewModel, User>(() {
  return WelcomeViewModel();
});
