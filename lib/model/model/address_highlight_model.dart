import 'package:sample_map_app/model/model/highlight_model.dart';

class AddressHighlight {
  List<Highlight>? label;
  List<Highlight>? district;

  AddressHighlight({
    required this.label,
    required this.district,
  });

  factory AddressHighlight.fromJson(Map<String, dynamic> json) {
    var labelList = json['label'] != null
        ? (json['label'] as List).map((i) => Highlight.fromJson(i)).toList()
        : null;

    var districtList = json['district'] != null
        ? (json['district'] as List).map((i) => Highlight.fromJson(i)).toList()
        : null;

    return AddressHighlight(
      label: labelList,
      district: districtList,
    );
  }

  Map<String, dynamic> toJson() => {
        'label': label?.map((i) => i.toJson()).toList(),
        'district': district?.map((i) => i.toJson()).toList(),
      };
}
