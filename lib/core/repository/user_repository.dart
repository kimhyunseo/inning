import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inning/core/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class UserRepository {
  final uuid = Uuid(); // Uuid 생성기 준비

  Future<void> registerUser(User user) async {
    try {
      // 아이디 비었다면 아이디 생성, 안비었다면 그대로 사용
      final String newId = user.id.isEmpty ? uuid.v4() : user.id;
      final updateUser = User(
        id: newId,
        nickname: user.nickname,
        favoriteTeam: user.favoriteTeam,
        profileImage: user.profileImage,
      );
      final pref = await SharedPreferences.getInstance();
      await Future.wait([
        pref.setString('user_id', newId),
        FirebaseFirestore.instance
            .collection('user')
            .doc(newId)
            .set(updateUser.toJson()),
      ]);
    } catch (e) {
      print('레포지토리 에러 ${e}');
    }
  }

  // UserRepository.dart 에 추가
  Future<void> updateUser(User user) async {
    try {
      // 1. 이미 user.id에 값이 들어있어야 함
      if (user.id.isEmpty) throw Exception('유저 ID가 없습니다.');

      // 2. 파이어베이스 및 로컬 저장소 업데이트 (ID 생성 없이 덮어쓰기)
      await FirebaseFirestore.instance
          .collection('user')
          .doc(user.id)
          // set 대신 업데이트
          .update(user.toJson());

      print('회원정보 수정 완료: ${user.nickname}');
    } catch (e) {
      print('업데이트 레포지토리 에러 $e');
      rethrow;
    }
  }
}
