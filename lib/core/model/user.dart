import 'package:inning/core/model/team.dart';

class User {
  final String id;
  final String? nickname;
  final Team? favoriteTeam;
  final String? profileImage;

  User({required this.id, this.nickname, this.favoriteTeam, this.profileImage});

  User.fromJson(Map<String, dynamic> map)
    : this(
        id: map['id'],
        nickname: map['nickname'],
        favoriteTeam: map['favoriteTeam'] != null
            ? Team.fromJson(map['favoriteTeam'])
            : null,
        profileImage: map['profileImage'],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nickname': nickname,
      'favoriteTeam': favoriteTeam?.toJson(),
      'profileImage': profileImage,
    };
  }

  User copyWith({
    String? id,
    String? nickname,
    Team? favoriteTeam,
    String? profileImage,
  }) {
    return User(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      favoriteTeam: favoriteTeam ?? this.favoriteTeam,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}
