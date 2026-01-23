import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inning/core/model/team.dart';
import 'package:inning/core/model/user.dart';
import 'package:inning/core/repository/user_repository.dart';

class WelcomeState {
  User user;
  bool isLoading;

  WelcomeState({required this.user, required this.isLoading});

  WelcomeState copyWith({User? user, bool? isLoading}) {
    return WelcomeState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class WelcomeViewModel extends Notifier<WelcomeState> {
  //
  @override
  WelcomeState build() {
    // Future
    return WelcomeState(
      user: User(id: '', nickname: '', favoriteTeam: null, profileImage: null),
      isLoading: false,
    );
  }

  // 상태 업데이트
  void updateNickname(String nickname) {
    state = state.copyWith(user: state.user.copyWith(nickname: nickname));
  }

  // 상태 업데이트
  void updateFavoriteTeam(Team? favoriteTeam) {
    state = state.copyWith(
      user: state.user.copyWith(favoriteTeam: favoriteTeam),
    );
  }

  void updateProfileImage(String? profileImage) {
    state = state.copyWith(
      user: state.user.copyWith(profileImage: profileImage),
    );
  }

  // 1. 마이페이지 진입 시 기존 유저 정보를 뷰모델 상태에 주입
  void setUser(User user) {
    state = state.copyWith(user: user);
    // 이제 state.id, state.nickname 등이 기존 정보로 채워집니다.
  }

  // 2. 정보 수정 저장 (업데이트 전용)
  Future<void> updateUserInfo() async {
    if (state.user.nickname == null || state.user.nickname!.isEmpty) return;
    try {
      final repository = UserRepository();
      // 기존 ID가 담긴 state를 전달하여 덮어쓰기
      await repository.updateUser(state.user);
      print('회원정보 수정 완료');
    } catch (e) {
      print('뷰모델 업데이트 에러 $e');
    }
  }

  // 저장 (로컬 + 파이어베이스)
  Future<void> registerUser() async {
    if (state.user.nickname == null || state.user.nickname!.isEmpty) return;
    try {
      final repository = UserRepository();
      final userId = await repository.registerUser(state.user);

      if (userId == null) return;
      state = state.copyWith(user: state.user.copyWith(id: userId));

      print('회원가입 프로세스 완료');
    } catch (e) {
      print('뷰모델 저장에러 ${e}');
    }
  }

  Future<void> uploadImage(XFile xFile) async {
    state = state.copyWith(isLoading: true);

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
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}

final welcomeProvider = NotifierProvider<WelcomeViewModel, WelcomeState>(() {
  return WelcomeViewModel();
});
