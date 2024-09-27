import 'package:sample_map_app/model/internet/api_service.dart';
import 'package:sample_map_app/model/model/autocomplete_response_model.dart';
import 'package:sample_map_app/model/model/item_model.dart';
import 'package:sample_map_app/model/model/place_model.dart';
import 'package:sample_map_app/model/model/search_response_model.dart';
import 'package:sample_map_app/values/constrain_value.dart';

class SearchRepository {
  final ApiService _apiService;

  SearchRepository(this._apiService);

  Future<List<Item>> searchLocation(String keyword) async {
    try {
      final jsonData = await _apiService.getAutoCompleteResult(
        'autocomplete',
        queryParameters: {
          'apiKey': ConstrainValue.apiKey,
          'q': keyword,
          'in': 'countryCode:${ConstrainValue.vietnamCode}',
          'lang': ConstrainValue.language,
          'limit': ConstrainValue.searchLimit,
        },
      );
      final response = AutocompleteResponse.fromJson(jsonData.data);
      return response.items;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Place> searchDetailLocation(String keyword) async {
    try {
      final jsonData = await _apiService.getAutoCompleteResult(
        'geocode',
        queryParameters: {
          'apiKey': ConstrainValue.apiKey,
          'q': keyword,
        },
      );
      final response = SearchResponseModel.fromJson(jsonData.data);
      return response.listPosition.first;
    } catch (e) {
      throw Exception(e);
    }
  }
  
}
