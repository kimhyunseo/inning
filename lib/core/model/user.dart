class User {
  final String id;
  final String? nickname;
  final String? favoriteTeam;
  final String? profileImage;

  User({required this.id, this.nickname, this.favoriteTeam, this.profileImage});

  User.fromJson(Map<String, dynamic> map)
    : this(
        id: map['id'],
        nickname: map['nickname'],
        favoriteTeam: map['favoriteTeam'],
        profileImage: map['profileImage'],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nickname': nickname,
      'favoriteTeam': favoriteTeam,
      'profileImage': profileImage,
    };
  }
}
