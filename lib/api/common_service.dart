import 'package:dio/dio.dart';
import 'package:wanandroid/api/api.dart';
import 'package:wanandroid/net/http_request.dart';

class CommonService {
  // void login(String username, String password, {Function? callback}) {
  //   var params = {
  //     "username": username,
  //     "password": password,
  //   };
  //   HttpRequest.request(Api.LOGIN, data: params, onSuccess: (result) {
  //     if(null!= callback){
  //       callback(result);
  //     }
  //   });
  // }
  // void register(String username, String password, {Function? callback}) {
  //   var params = {
  //     "username": username,
  //     "password": password,
  //     "repassword": password,
  //   };
  //   HttpRequest.request(Api.REGISTER, data: params, onSuccess: (result) {
  //
  //     if(null!= callback){
  //       callback(result);
  //     }
  //   });
  // }

  Future<Response> login(String username, String password) async {
    FormData formData = new FormData.fromMap({
      "username": "$username",
      "password": "$password",
    });
    return await Dio().post(Api.LOGIN, data: formData);
  }

  Future<Response> register(String username, String password) async {
    FormData formData = new FormData.fromMap({
      "username": "$username",
      "password": "$password",
      "repassword": "$password",
    });
    return await Dio().post(Api.REGISTER, data: formData);
  }
}
