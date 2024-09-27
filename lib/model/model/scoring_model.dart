import 'package:sample_map_app/model/model/fieldscore_model.dart';

class Scoring {
  final double queryScore;
  final FieldScore fieldScore;

  Scoring({
    required this.queryScore,
    required this.fieldScore,
  });

  factory Scoring.fromJson(Map<String, dynamic> json) {
    return Scoring(
      queryScore: json['queryScore'].toDouble(),
      fieldScore: FieldScore.fromJson(json['fieldScore']),
    );
  }
}