import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:wanandroid/application.dart';
import 'package:wanandroid/utils/toast_util.dart';

class CustomInterceptors extends InterceptorsWrapper {
  // @override
  // Future? onRequest(RequestOptions options) {
  //   /// 在拦截里设置公共请求头
  //   options.headers = {HttpHeaders.authorizationHeader: 'eyJ0eXAiOiJKLCJhbGciOiJIUzI1NiJ9.eyJvcmdUeXBlIjoiQUdFTkNZIiwicmVhbE5hbWUiOiIlRTYlOUQlOEUlRTUlQTMlQUMlRTUlQUElOUEiLCJncm91cElkIjoxLCJtb2JpbGUiOiIxODExNjIxNTgwOSIsImVkaXRpb24iOjEsImFnZW5jeUlkIjo3MzczLCJ1c2VySWQiOjEzMjUwLCJpYXQiOjE2MDQ0OTA4ODcsImF1dGhvcml0aWVzIjpbIjEiLCIzIiwiNCIsIjUiLCI2IiwiMTgiLCIxIiwiMiIsIjMiLCI0IiwiNSIsIjYiLCIyMCIsIjIxIiwiMjMiLCIyNCIsIjI1IiwiNyIsIjgiLCI5IiwiMTAiLCIxMSIsIjEyIiwiMTMiLCIxNCIsIjE1IiwiMTYiLCIxNyIsIjE5IiwiMjIiLCIyNyIsIjI5IiwiMTgiLCI0IiwiMTgiLCIyNiIsIjE4IiwiMzEiLCIzMyIsIjM0IiwiOCIsIjkiLCIxNSIsIjE4Il0sInVzZXJuYW1lIjoicG9fMTU3NTQ0ODU3NV83MzczIn0.Q_-FXnpSi2kjLrSupPfgDtHlu1m_Qh25HTs88TchNyg'};
  //   if (Application.debug) {
  //     try {
  //       print("请求url：${options.path}");
  //       print('请求头: ' + options.headers.toString());
  //       /// 可以在这里个性定制 如签名 key value 从小到大排序 options.data  再次赋值即可
  //       print('请求体: ' + options.data);
  //     } catch (e) {
  //       print(e);
  //     }
  //   }
  //   return super.onRequest(options);
  // }
  // @override
  // Future onResponse(Response response) async{
  //   // LoadingUtil.closeLoading();
  //   if (Application.debug) {
  //     print('code=${response.statusCode.toString()} ==data=${response.data
  //         .toString()}');
  //   }
  //   return super.onResponse(response);
  // }
  // @override
  // Future onError(DioError err) {
  //   // TODO: implement onError
  //   // LoadingUtil.closeLoading();
  //   if (err.type == DioErrorType.CONNECT_TIMEOUT
  //       || err.type == DioErrorType.RECEIVE_TIMEOUT
  //       || err.type == DioErrorType.SEND_TIMEOUT) {
  //     ToastUtil.showToast('请求超时');
  //   } else {
  //     ToastUtil.showToast( '服务异常');
  //   }
  //   return super.onError(err);
  // }
@override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  options.headers = {HttpHeaders.authorizationHeader: ''};
    if (Application.debug) {
      try {
        print("请求url：${options.path}");
        print('请求头: ${options.headers.toString()}');
        /// 可以在这里个性定制 如签名 key value 从小到大排序 options.data  再次赋值即可
        print('请求体: ${options.data}');
      } catch (e) {
        print(e);
      }
    }
    super.onRequest(options, handler);
  }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // LoadingUtil.closeLoading();
      if (Application.debug) {
        print('code=${response.statusCode.toString()} ==data=${response.data
            .toString()}');
      }
    super.onResponse(response, handler);
  }
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // LoadingUtil.closeLoading();
      if (err.type == DioErrorType.connectionTimeout
          || err.type == DioErrorType.receiveTimeout
          || err.type == DioErrorType.sendTimeout) {
        ToastUtil.showToast('请求超时');
      } else {
        ToastUtil.showToast( '服务异常');
      }
    super.onError(err, handler);
  }
}