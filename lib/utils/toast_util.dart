import 'package:flutter_easyloading/flutter_easyloading.dart';

class ToastUtil {
  static void showToast(String msg) {
    EasyLoading.showToast(msg);
  }

  static void showError(String msg) {
    EasyLoading.showError(msg);
  }


  static void showSuccess(String msg) {
    EasyLoading.showSuccess(msg);
  }

  static void showInfo(String msg) {
    EasyLoading.showInfo(msg);
  }
  static void showLoading({String state = "loading..."}){
    EasyLoading.show(status: state);
  }

  static void dismiss() {
    EasyLoading.dismiss();
  }

}