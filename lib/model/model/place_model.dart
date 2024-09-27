import 'package:sample_map_app/model/model/access_model.dart';
import 'package:sample_map_app/model/model/address_model.dart';
import 'package:sample_map_app/model/model/category_model.dart';
import 'package:sample_map_app/model/model/position_model.dart';

class Place {
  final String title;
  final String id;
  final String resultType;
  final String? localityType;
  final Address address;
  final Position position;
  final List<Access>? access;
  final List<PlaceCategory>? categories;

  Place({
    required this.title,
    required this.id,
    required this.resultType,
    this.localityType,
    required this.address,
    required this.position,
    this.access,
    this.categories,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      title: json['title'],
      id: json['id'],
      resultType: json['resultType'],
      localityType: json['localityType'],
      address: Address.fromJson(json['address']),
      position: Position.fromJson(json['position']),
      access: json['access'] != null
          ? (json['access'] as List)
              .map((accessItem) => Access.fromJson(accessItem))
              .toList()
          : null,
      categories: json['categories'] != null
          ? (json['categories'] as List)
              .map((categoryItem) => PlaceCategory.fromJson(categoryItem))
              .toList()
          : null,
    );
  }
}
