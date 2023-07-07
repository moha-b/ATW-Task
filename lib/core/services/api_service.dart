import 'package:dio/dio.dart';

class ApiService {
  final baseUrl = BASE_URL;
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get(baseUrl + endPoint);
    return response.data;
  }
}
