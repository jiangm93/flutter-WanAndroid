import 'dart:ffi';

class ResultData {
  var data;
  int? errorCode;
  String? errorMsg;


  ResultData({this.data, this.errorCode, this.errorMsg});
}
