class Position {
  final double lat;
  final double lng;

  Position({
    required this.lat,
    required this.lng,
  });

  factory Position.fromJson(Map<String, dynamic> json) {
    return Position(
      lat: json['lat'].toDouble(),
      lng: json['lng'].toDouble(),
    );
  }
}