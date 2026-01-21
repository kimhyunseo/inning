import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/model/user.dart';

class WelcomeState {
  //
}

class WelcomeViewModel extends Notifier<User> {
  //
  @override
  User build() {
    return User(id: Uuid().v4(), nickname: '', favoriteTeam: null); //
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
  void updateFavoriteTeam(Team favoriteTeam) {
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
      // 로컬에 저장
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('user_id', state.id);
      // 파이어베이스에 저장
      await FirebaseFirestore.instance
          .collection('user')
          .doc(state.id)
          .set(state.toJson());
      print('저장 성공: ${state.id}');
    } catch (e) {
      print('저장 중 오류 발생: $e');
    }
  }
}

final welcomeProvider = NotifierProvider<WelcomeViewModel, User>(() {
  return WelcomeViewModel();
});
