class Access {
  final double lat;
  final double lng;

  Access({
    required this.lat,
    required this.lng,
  });

  factory Access.fromJson(Map<String, dynamic> json) {
    return Access(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}