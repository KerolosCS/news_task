import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get() async {
    var response = await _dio.get(
        'https://newsapi.org/v2/everything?q=apple&from=2023-10-21&to=2023-10-21&sortBy=popularity&apiKey=95d39f5147a247b2851094bfdfa24cd2');
    return response.data;
  }
}

// void main(List<String> args) async {
//   ApiService api = ApiService(Dio());

//   var res = await api.get();
//   print(res);
// }
