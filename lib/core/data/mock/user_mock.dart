import 'package:inning/core/data/mock/team_mock.dart';
import 'package:inning/core/model/user.dart';

final List<User> mockUsers = [
  User(
    id: 'user1',
    nickname: '현서',
    favoriteTeam: mockTeams.firstWhere((team) => team.id == 'ssg'),
    profileImage: null,
  ),
  User(
    id: 'user2',
    nickname: '민수',
    favoriteTeam: mockTeams.firstWhere((team) => team.id == 'kiwoom'),
    profileImage: null,
  ),
  User(
    id: 'user3',
    nickname: '지우',
    favoriteTeam: mockTeams.firstWhere((team) => team.id == 'lg'),
    profileImage: null,
  ),
  User(
    id: 'user4',
    nickname: '수현',
    favoriteTeam: mockTeams.firstWhere((team) => team.id == 'doosan'),
    profileImage: null,
  ),
  User(
    id: 'user5',
    nickname: '태희',
    favoriteTeam: mockTeams.firstWhere((team) => team.id == 'kt'),
    profileImage: null,
  ),
  User(id: 'user6', nickname: '지훈', favoriteTeam: null, profileImage: null),
];

final User currentUser = mockUsers.firstWhere((u) => u.id == 'user1');
