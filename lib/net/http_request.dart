import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:wanandroid/net/http_manager.dart';
import 'package:wanandroid/net/result_data.dart';
import 'package:wanandroid/utils/toast_util.dart';

class HttpRequest {
  /// 公共的Http 请求
  static request<T>(String path,
      {String method = 'POST',
        var data,
        var queryParameters,
        String contentType = Headers.formUrlEncodedContentType,
        bool isShowError = true, Function(ResultData)? onSuccess, Function? onFail}) async {
    try {
      var response = await HttpManager.dio?.request(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(
              method: method,
              contentType: contentType,
              responseType: ResponseType.plain));
      Map<String, dynamic> dataMap = {};
      if (response?.statusCode == 200) {
        /// http 请求成功
        if (response?.data != null) {
          if (response?.data is String) {
            dataMap = json.decode(response?.data as String);
          } else {
            dataMap = response?.data ?? {};
          }
          print("返回结果：$dataMap");
          if (isShowError &&
              dataMap['errorCode'] != HttpConfig.codeSuccess) {
            ToastUtil.showToast( dataMap['errorMsg'] ?? '未知异常');
          }
        }

        /// 请求成功 可根据你的实际情况修改
         print("返回结果-ResultData：----");
        var data = ResultData(
            data: dataMap['data'],
            errorCode: dataMap['errorCode'] ?? HttpConfig.codeSuccess,
            errorMsg: dataMap['errorMsg']);

        print("返回结果-ResultData：$data");
        if (onSuccess != null) {
          print("返回结果-ResultData-onSuccess：$data");
          onSuccess(data);
        }
      } else {
        if (onFail != null) {
//        var data =  ResultData(data: null, code: response.statusCode.toString());
          onFail();
        }
      }
    } catch (e) {
      if (e is DioError) {
        if (onFail != null) {
          onFail();
        }
      }
    }
  }
}