import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inning/core/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserUtil {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// SharedPreferences에 저장된 user_id 가져오기
  static Future<String?> getUserId() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString('user_id');
  }

  /// 현재 로그인된 유저 객체 가져오기
  static Future<User?> getCurrentUser() async {
    final userId = await getUserId();
    if (userId == null) return null;

    final doc = await _firestore.collection('user').doc(userId).get();
    if (!doc.exists) return null;

    final data = doc.data()!;
    final userData = {...data, 'id': doc.id};
    return User.fromJson(userData);
  }

  /// 유저가 등록되었는지 확인
  static Future<bool> isRegistered() async {
    final userId = await getUserId();
    print(userId);
    if (userId == null) return false;

    final doc = await _firestore.collection('user').doc(userId).get();
    return doc.exists;
  }

  /// id로 유저 객체 가져오기
  static Future<User?> getUserById(String userId) async {
    if (userId.isEmpty) return null;

    final doc = await _firestore.collection('user').doc(userId).get();
    if (!doc.exists) return null;

    final data = doc.data()!;
    final userData = {...data, 'id': doc.id};
    return User.fromJson(userData);
  }
}
