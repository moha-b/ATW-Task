import 'package:dio/dio.dart';

class ApiService {
  final baseUrl = "https://jsonplaceholder.typicode.com";
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> getMap({required String endPoint}) async {
    var response = await _dio.get("$baseUrl$endPoint");
    //_dio.interceptors.add(LogInterceptor(responseBody: true));
    return response.data;
  }

  Future<List<dynamic>> getList({required String endPoint}) async {
    var response = await _dio.get("$baseUrl$endPoint");
    return response.data;
  }
}
