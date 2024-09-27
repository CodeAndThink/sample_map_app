class FieldScore {
  final double placeName;

  FieldScore({required this.placeName});

  factory FieldScore.fromJson(Map<String, dynamic> json) {
    return FieldScore(
      placeName: json['placeName'].toDouble(),
    );
  }
}