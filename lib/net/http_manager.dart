


import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:wanandroid/application.dart';
import 'package:wanandroid/net/custom_interceptors.dart';
import 'package:wanandroid/net/log_interceptors.dart';

const String BASE_URL = 'https://www.wanandroid.com';
class HttpConfig{
  static const baseUrl = BASE_URL;
  static const timeout = 5000;
  static const codeSuccess = 0;

}



class HttpManager {

  static HttpManager get install => getInstance();
  static HttpManager? _install;
  static Dio? dio;
  HttpManager._internal() {
    // 初始化
  }
  static HttpManager getInstance() {
    _install ??= HttpManager._internal();
    return _install!;
  }

  static void initNet(){
    dio = Dio(BaseOptions(
        baseUrl: HttpConfig.baseUrl,
        contentType: 'application/x-www-form-urlencoded',
        connectTimeout:const Duration(seconds:  HttpConfig.timeout),
        receiveTimeout: const Duration(seconds:  HttpConfig.timeout)
    ));
    if (Application.proxy) {
      /// 用于代理 抓包
      (dio?.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (client) {
        client.findProxy = (uri) {
          //// PROXY 是固定  后面的localhost:8888 指的是别人的机器ip
          return 'PROXY localhost:8888';
        };
      };
    }
    /// 添加拦截器
    // dio?.interceptors.add(CustomInterceptors());
    dio?.interceptors.add(DioLogInterceptor());

    dio?.interceptors.add(Application.alice!.getDioInterceptor());
  }



  // static Dio _dioInstance;
  // static Dio getDioInstance() {
  //   if (_dioInstance == null) {
  //     _dioInstance = Dio();
  //   }
  //
  //   return _dioInstance;
  // }
  //
  // static Future get(String url, {Map<String, dynamic> queryParams}) async {
  //   try{
  //     return await HttpUtil.getDioInstance().get(url, queryParameters: queryParams);
  //   } on DioError catch (e) {
  //     EasyLoading.showError(e.message);
  //   } on Exception catch (e) {
  //     EasyLoading.showError(e.toString());
  //   }
  // }
}