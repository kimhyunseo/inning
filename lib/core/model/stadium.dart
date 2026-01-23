class Stadium {
  final String id;
  final String name;
  final String imageAsset;
  final double latitude;
  final double longitude;

  const Stadium({
    required this.id,
    required this.name,
    required this.imageAsset,
    required this.latitude,
    required this.longitude,
  });

  // Firestore / JSON에 저장할 때
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageAsset': imageAsset,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  // Firestore / JSON에서 불러올 때
  factory Stadium.fromJson(Map<String, dynamic> json) {
    return Stadium(
      id: json['id'] as String,
      name: json['name'] as String,
      imageAsset: json['imageAsset'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );
  }
}
