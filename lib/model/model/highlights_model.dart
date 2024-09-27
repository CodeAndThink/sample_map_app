import 'package:sample_map_app/model/model/address_highlight_model.dart';
import 'package:sample_map_app/model/model/highlight_model.dart';

class Highlights {
  List<Highlight> title;
  AddressHighlight address;

  Highlights({
    required this.title,
    required this.address,
  });

  factory Highlights.fromJson(Map<String, dynamic> json) {
    var titleList =
        (json['title'] as List).map((i) => Highlight.fromJson(i)).toList();
    return Highlights(
      title: titleList,
      address: AddressHighlight.fromJson(json['address']),
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title.map((i) => i.toJson()).toList(),
        'address': address.toJson(),
      };
}
