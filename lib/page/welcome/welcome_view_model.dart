import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inning/core/model/team.dart';
import 'package:inning/core/model/user.dart';
import 'package:inning/core/repository/user_repository.dart';

class WelcomeState {
  // 이 부분 수정 필요
  // String? profileImage;
  // WelcomeState({this.profileImage});
}

class WelcomeViewModel extends Notifier<User> {
  //
  @override
  User build() {
    return User(
      id: '',
      nickname: '',
      favoriteTeam: null,
      profileImage: null,
    ); //
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

  void updateProfileImage(String? profileImage) {
    state = User(
      id: state.id,
      nickname: state.nickname,
      favoriteTeam: state.favoriteTeam,
      profileImage: profileImage,
    );
  }

  // 1. 마이페이지 진입 시 기존 유저 정보를 뷰모델 상태에 주입
  void setUser(User user) {
    state = user;
    // 이제 state.id, state.nickname 등이 기존 정보로 채워집니다.
  }

  // 2. 정보 수정 저장 (업데이트 전용)
  Future<void> updateUserInfo() async {
    if (state.nickname == null || state.nickname!.isEmpty) return;
    try {
      final repository = UserRepository();
      // 기존 ID가 담긴 state를 전달하여 덮어쓰기
      await repository.updateUser(state);
      print('회원정보 수정 완료');
    } catch (e) {
      print('뷰모델 업데이트 에러 $e');
    }
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

  Future<void> uploadImage(XFile xFile) async {
    // 서버와 통신하는 부분은 항상 트라이캐치
    try {
      // Storage 사용법
      // 1. 파이어베이스스토리지 객체 가지고 오기
      final storage = FirebaseStorage.instance;
      // 2. 스토리지 참조 만들기
      Reference ref = storage.ref();
      // 3. 파일 참조 만들기
      Reference fileRef = ref.child(
        '${DateTime.now().microsecondsSinceEpoch}_${xFile.name}',
      );
      // 4. 쓰기!
      await fileRef.putFile(File(xFile.path));
      // 5. 파일에 접근할 수 있는 유알엘 받기
      String profileImage = await fileRef.getDownloadURL();
      updateProfileImage(profileImage);
    } catch (e) {
      print(e);
    }
  }
}

final welcomeProvider = NotifierProvider<WelcomeViewModel, User>(() {
  return WelcomeViewModel();
});
