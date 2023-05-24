import 'package:dio/dio.dart';

class DioHelper {
  static Dio _dio = Dio();

  static Future<Response?> getData(String url) async {
    try {
      Response response = await _dio.get(url);
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<Response?> postData(String url, dynamic data) async {
    try {
      Response response = await _dio.post(url, data: data);
      print(response.data);
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
