import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = 'http://localhost:8000/api';
  }

  Future<Response> getRequest(String endpoint) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.get(endpoint);
  }

  Future<Response> postRequest(String endpoint, Map<String, dynamic> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.post(endpoint, data: data);
  }
}
