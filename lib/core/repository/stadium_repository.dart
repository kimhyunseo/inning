import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inning/core/model/stadium.dart';

class StadiumRepository {
  final FirebaseFirestore firestore;

  StadiumRepository({FirebaseFirestore? firestore})
    : firestore = firestore ?? FirebaseFirestore.instance;

  /// 전체 경기장 가져오기
  Future<List<Stadium>> fetchStadiums() async {
    final snapshot = await firestore.collection('stadiums').get();
    return snapshot.docs.map((doc) => Stadium.fromJson(doc.data())).toList();
  }

  /// ID로 경기장 가져오기
  Future<Stadium?> fetchStadiumById(String id) async {
    final doc = await firestore.collection('stadiums').doc(id).get();
    if (!doc.exists) return null;
    return Stadium.fromJson(doc.data()!);
  }
}
