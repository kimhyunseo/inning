import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inning/core/model/team.dart';

class TeamRepository {
  final FirebaseFirestore firestore;

  TeamRepository({FirebaseFirestore? firestore})
    : firestore = firestore ?? FirebaseFirestore.instance;

  /// 전체 팀 가져오기
  Future<List<Team>> fetchTeams() async {
    try {
      final snapshot = await firestore.collection('teams').get();

      // 문서가 하나도 없을 경우 빈 리스트 반환
      if (snapshot.docs.isEmpty) {
        print("⚠️ [TeamRepository] 'teams' 컬렉션에 데이터가 없습니다.");
        return [];
      }

      return snapshot.docs.map((doc) {
        final data = doc.data();

        // Firestore의 문서 ID(예: 'lg', 'ssg')를 id 필드에 강제로 주입
        // 이렇게 해야 findTeam('lg')와 같은 로직이 정상 작동합니다.
        return Team.fromJson({...data, 'id': doc.id});
      }).toList();
    } catch (e) {
      print("[TeamRepository] fetchTeams 에러: $e");
      rethrow;
    }
  }

  /// ID로 팀 가져오기
  Future<Team?> fetchTeamById(String id) async {
    try {
      final doc = await firestore.collection('teams').doc(id).get();

      if (!doc.exists || doc.data() == null) {
        print("[TeamRepository] ID가 '$id'인 팀을 찾을 수 없습니다.");
        return null;
      }

      return Team.fromJson({...doc.data()!, 'id': doc.id});
    } catch (e) {
      print("[TeamRepository] fetchTeamById 에러: $e");
      rethrow;
    }
  }

  /// 팀 추가/업데이트
  Future<void> setTeam(Team team) async {
    try {
      await firestore.collection('teams').doc(team.id).set(team.toJson());
    } catch (e) {
      print("[TeamRepository] setTeam 에러: $e");
      rethrow;
    }
  }
}
