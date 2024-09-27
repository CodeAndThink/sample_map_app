import 'package:dio/dio.dart';

class ApiService {
  final String _baseAutoCompleteUrl =
      'https://autocomplete.search.hereapi.com/v1/';
  final String _baseGeocodeUrl =
      'https://geocode.search.hereapi.com/v1/';

  late final Dio _dio;
  ApiService() {
    _dio = Dio();
  }

  Future<Response> getAutoCompleteResult(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(
        _baseAutoCompleteUrl + endpoint,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to load data: ${e.response?.statusCode}');
    }
  }

  Future<Response> getCoordinatesFromAddress(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(
        _baseGeocodeUrl + endpoint,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to load data: ${e.response?.statusCode}');
    }
  }
}
