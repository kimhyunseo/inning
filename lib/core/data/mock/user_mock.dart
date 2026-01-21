import 'package:inning/core/model/user.dart';
import 'package:inning/core/model/team.dart';

List<User> createMockUsers(List<Team> teams) {
  Team? findTeam(String id) {
    try {
      return teams.firstWhere((t) => t.id == id);
    } catch (e) {
      return null; // 찾는 팀이 없으면 null
    }
  }

  return [
    User(
      id: 'user1',
      nickname: '현서',
      favoriteTeam: findTeam('ssg'),
      profileImage: null,
    ),
    User(
      id: 'user2',
      nickname: '민수',
      favoriteTeam: findTeam('kiwoom'),
      profileImage: null,
    ),
    User(
      id: 'user3',
      nickname: '지우',
      favoriteTeam: findTeam('lg'),
      profileImage: null,
    ),
    User(
      id: 'user4',
      nickname: '수현',
      favoriteTeam: findTeam('doosan'),
      profileImage: null,
    ),
    User(
      id: 'user5',
      nickname: '태희',
      favoriteTeam: findTeam('kt'),
      profileImage: null,
    ),
    User(id: 'user6', nickname: '지훈', favoriteTeam: null, profileImage: null),
  ];
}

// 현재 유저도 생성 함수에서 가져오도록
User getCurrentUser(List<User> users) =>
    users.firstWhere((u) => u.id == 'user1');
