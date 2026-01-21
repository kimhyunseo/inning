class Team {
  final String id;
  final String name;
  final String logoAsset;
  final String emblemAsset;

  const Team({
    required this.id,
    required this.name,
    required this.logoAsset,
    required this.emblemAsset,
  });

  // Firestore / JSON에 저장할 때
  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'] as String,
      name: json['name'] as String,
      logoAsset: json['logoAsset'] as String,
      emblemAsset: json['emblemAsset'] as String,
    );
  }

  // Firestore / JSON에서 불러올 때
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logoAsset': logoAsset,
      'emblemAsset': emblemAsset,
    };
  }
}
