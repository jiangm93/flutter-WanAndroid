import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:wanandroid/api/api.dart';
import 'package:wanandroid/application.dart';
import 'package:wanandroid/net/interceptor/custom_interceptors.dart';

const String BASE_URL = Api.BASE_URL;

class HttpConfig {
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

  static void initNet() {
    dio = Dio(BaseOptions(
        baseUrl: HttpConfig.baseUrl,
        contentType: Headers.formUrlEncodedContentType,
        responseType: ResponseType.plain,
        connectTimeout: const Duration(seconds: HttpConfig.timeout),
        receiveTimeout: const Duration(seconds: HttpConfig.timeout)));
    if (Application.proxy) {
      /// 用于代理 抓包
      (dio?.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.findProxy = (uri) {
          //// PROXY 是固定  后面的localhost:8888 指的是别人的机器ip
          return 'PROXY localhost:8888';
        };
      };
    }

    /// 添加拦截器
    dio?.interceptors.add(CustomInterceptors());
    // dio?.interceptors.add(DioLogInterceptor());

    // dio?.interceptors.add(Application.alice!.getDioInterceptor());
    // dio?.interceptors.add(LogInterceptor(requestBody: true,responseBody: true));
    dio?.interceptors.add(CookieManager(CookieJar()));
    dio?.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
  }
}
