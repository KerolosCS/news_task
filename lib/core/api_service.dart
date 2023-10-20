import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get() async {
    var response = await _dio.get(
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=95d39f5147a247b2851094bfdfa24cd2');
    return response.data;
  }
}


