// import 'dart:async';
// import 'dart:convert';
//
// import 'package:dio/dio.dart';
// import 'package:wanandroid/api/common_service.dart';
// import 'package:wanandroid/utils/data_util.dart';
// import 'package:wanandroid/utils/sp_util.dart';
//
// class User {
//   String userName;
//   String password;
//   String cookie;
//   DateTime cookieExpiresTime;
//   Map<String, String>? _headerMap;
//
//   static final User _singleton = User._internal();
//
//   factory User() {
//     return _singleton;
//   }
//
//   User._internal();
//
//   bool isLogin() {
//     return null != userName &&
//         userName.length >= 6 &&
//         null != password &&
//         password.length >= 6;
//   }
//
//   void logout() {
//     SpUtil.putUserName(null);
//     SpUtil.putPassword(null);
//     userName = null;
//     password = null;
//     _headerMap = null;
//   }
//
//   void refreshUserData({Function? callback}) {
//     SpUtil.getPassword((pw) {
//       this.password = pw;
//     });
//     SpUtil.getUserName((str) {
//       this.userName = str;
//       if (null != callback) {
//         callback();
//       }
//     });
//     SpUtil.getCookie((str) {
//       this.cookie = str;
//       _headerMap = null;
//     });
//     SpUtil.getCookieExpires((str) {
//       if (null != str && str.length > 0) {
//         this.cookieExpiresTime = DateTime.parse(str);
//         //提前3天请求新的cookie
//         if (cookieExpiresTime.isAfter(DateUtil.getDaysAgo(3))) {
//           Timer(Duration(milliseconds: 100), () {
//             autoLogin();
//           });
//         }
//       }
//     });
//   }
//
//   void login({Function? callback}) {
//     _saveUserInfo(CommonService().login(userName, password), userName, password,
//         callback: callback);
//   }
//
//   void register({Function? callback}) {
//     _saveUserInfo(
//         CommonService().register(userName, password), userName, password,
//         callback: callback);
//   }
//
//   void _saveUserInfo(
//       Future<Response> responseF, String userName, String password,
//       {Function? callback}) {
//     responseF.then((response) {
//       var userModel = UserModel.fromJson(response.data);
//       if (userModel.errorCode == 0) {
//         SpUtil.putUserName(userName);
//         SpUtil.putPassword(password);
//         String cookie = "";
//         DateTime expires;
//         response.headers.forEach((String name, List<String> values) {
//           if (name == "set-cookie") {
//             cookie = json
//                 .encode(values)
//                 .replaceAll("\[\"", "")
//                 .replaceAll("\"\]", "")
//                 .replaceAll("\",\"", "; ");
//             try {
//               expires = DateUtil.formatExpiresTime(cookie);
//             } catch (e) {
//               expires = DateTime.now();
//             }
//           }
//         });
//         SpUtil.putCookie(cookie);
//         SpUtil.putCookieExpires(expires.toIso8601String());
//         if (null != callback) callback(true, null);
//       } else {
//         if (null != callback) callback(false, userModel.errorMsg);
//       }
//     });
//   }
//
//   void autoLogin() {
//     if (isLogin()) {
//       login();
//     }
//   }
//
//   Map<String, String>? getHeader() {
//     if (null == _headerMap) {
//       _headerMap = Map();
//       _headerMap?["Cookie"] = cookie;
//     }
//     return _headerMap;
//   }
// }
