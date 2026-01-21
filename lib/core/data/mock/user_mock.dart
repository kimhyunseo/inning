import 'package:inning/core/model/user.dart';

final List<User> mockUsers = [
  User(id: 'user1', nickname: '현서', favoriteTeam: 'ssg', profileImage: null),
  User(id: 'user2', nickname: '민수', favoriteTeam: 'kiwoom', profileImage: null),
  User(id: 'user3', nickname: '지우', favoriteTeam: 'lg', profileImage: null),
  User(id: 'user4', nickname: '수현', favoriteTeam: 'doosan', profileImage: null),
  User(id: 'user5', nickname: '태희', favoriteTeam: 'kt', profileImage: null),
  User(id: 'user6', nickname: '지훈', favoriteTeam: null, profileImage: null),
];

final User currentUser = mockUsers.firstWhere((u) => u.id == 'user1');
