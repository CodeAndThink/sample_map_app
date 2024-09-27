import 'package:sample_map_app/model/model/item_model.dart';

class AutocompleteResponse {
  List<Item> items;

  AutocompleteResponse({required this.items});

  factory AutocompleteResponse.fromJson(Map<String, dynamic> json) {
    var itemList =
        (json['items'] as List).map((i) => Item.fromJson(i)).toList();
    return AutocompleteResponse(items: itemList);
  }

  Map<String, dynamic> toJson() => {
        'items': items.map((i) => i.toJson()).toList(),
      };
}
