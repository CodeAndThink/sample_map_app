import 'package:sample_map_app/model/model/place_model.dart';

class SearchResponseModel {
  final List<Place> listPosition;

  SearchResponseModel({required this.listPosition});

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) {
    return SearchResponseModel(
      listPosition: (json['items'] as List)
          .map((placeJson) => Place.fromJson(placeJson))
          .toList(),
    );
  }
}
