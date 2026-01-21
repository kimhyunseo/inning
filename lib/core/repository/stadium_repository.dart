import 'package:inning/core/model/stadium.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StadiumRepository {
  final FirebaseFirestore firestore;

  StadiumRepository({FirebaseFirestore? firestore})
    : firestore = firestore ?? FirebaseFirestore.instance;

  Future<List<Stadium>> fetchStadiums() async {
    try {
      final snapshot = await firestore.collection('stadiums').get();
      return snapshot.docs.map((doc) => Stadium.fromJson(doc.data())).toList();
    } catch (e) {
      print('StadiumRepository fetch error: $e');
      return [];
    }
  }
}
