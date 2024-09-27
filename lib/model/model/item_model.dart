import 'package:sample_map_app/model/model/address_model.dart';
import 'package:sample_map_app/model/model/highlights_model.dart';

class Item {
  String title;
  String id;
  String language;
  String resultType;
  String? localityType;
  Address address;
  Highlights highlights;

  Item({
    required this.title,
    required this.id,
    required this.language,
    required this.resultType,
    this.localityType,
    required this.address,
    required this.highlights,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      title: json['title'] ?? '',
      id: json['id'] ?? '',
      language: json['language'] ?? '',
      resultType: json['resultType'] ?? '',
      localityType: json['localityType'],
      address: Address.fromJson(json['address']),
      highlights: Highlights.fromJson(json['highlights']),
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'id': id,
        'language': language,
        'resultType': resultType,
        'localityType': localityType,
        'address': address.toJson(),
        'highlights': highlights.toJson(),
      };
}
