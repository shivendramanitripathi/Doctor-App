import 'package:dio/dio.dart';
import 'url.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<dynamic>> fetchCountryStatus() async {
    try {
      final response =
          await _dio.get('${BaseUrl.apiUrl}${Endpoints.searchCountry}');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(' Status Code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed: $error');
    }
  }
}
