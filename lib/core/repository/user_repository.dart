import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inning/core/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class UserRepository {
  final uuid = Uuid(); // Uuid 생성기 준비

  Future<void> registerUser(User user) async {
    try {
      final String newId = uuid.v4();
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
      rethrow; // 뷰모델에서도 오류 알수 있게
    }
  }
}
