import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/api/api.dart';
import 'package:wanandroid/net/http_request.dart';
import 'package:wanandroid/router/router.dart';
import 'package:wanandroid/utils/toast_util.dart';
import 'package:wanandroid/widget/appbar.dart';
import 'package:wanandroid/widget/back_btn.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

// class _LoginPageState extends State<LoginPage>{
//   @override
//   Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("登录"),
//      ),
//      body: Center(
//        child: Text("登录页面"),
//      ),
//
//    );
//   }
//
// }

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;
  String? username = "saltfish1010";
  String? password = "jm123456";

  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();

  //FormState为Form的State类，可以通过 Form.of() 或GlobalKey获得。我们可以通过它来对
  //Form的子孙FormField进行统一操作。
  GlobalKey _formKey = GlobalKey<FormState>();

  void _Login() {
    print("登录");
    if (isChecked == false) {
      ToastUtil.showInfo("请确认勾选《用户协议》及《隐私政策》");
      // ToastUtil.showLoading();
      return;
    }
    // var params = {
    //   "username": username,
    //   "password": password,
    // };
    var params = {
      "username": "saltfish1010",
      "password": "jm123456",
    };
    // FormData formData = FormData.fromMap(params);
    // DioHelper.postData("https://www.wanandroid.com/user/login", formData);

    HttpRequest.request(Api.LOGIN,isShowLoading: true, data: params,
        onSuccess: (result) {
      ToastUtil.showSuccess("登录成功");
      RouteManager().navigateBack();

    });
  }

  void _changeCheck(bool? state) {
    setState(() {
      isChecked = state!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  appBar("登录",isShowBack:true),
      body: Center(
          child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Text(
            //   '欢迎登录',
            //   style: TextStyle(fontSize: 24),
            // ),
            SizedBox(height: 100),
            SizedBox(
              width: 300,
              child: TextFormField(
                autofocus: true,
                controller: _unameController,
                decoration: _createInputDecoration(Icons.person, "请输入用户名"),
                style: TextStyle(fontSize: 14),
                onChanged: (val) {
                  username = val;
                },
                validator: (v) {
                  return v!.trim().length > 0 ? null : '用户名不能为空';
                },
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 300,
              child: TextFormField(
                obscureText: true,
                autofocus: true,
                controller: _pwdController,
                decoration: _createInputDecoration(Icons.lock, '请输入密码'),
                style: TextStyle(fontSize: 14),
                onChanged: (val) {
                  password = val;
                },
                validator: (v) {
                  return v!.trim().length > 0 ? null : '密码不能为空';
                },
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 44,
              width: 250,
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: FilledButton(
                  onPressed: () {
                    if ((_formKey.currentState as FormState).validate()) {
                      //验证通过提交数据
                      _Login();
                    }
                  },
                  child: Text('登录'),
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: GestureDetector(
                  onTap: () {
                    RouteManager().navigateTo(RouteManager.registerRouter);
                  },
                  child: Text('注冊'),
                ),
              ),
            ),
            Spacer(),
            Container(
              child: Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Checkbox(
                      value: this.isChecked,
                      onChanged: (b) {
                        print(b);
                        _changeCheck(b);
                      }),
                  // Text("请仔细阅读《用户协议》及《隐私政策》"),
                  Text.rich(TextSpan(text: "请仔细阅读", children: [
                    TextSpan(
                        text: "《用户协议》",
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            ToastUtil.showToast("点击了用户协议");
                          }),
                    TextSpan(text: "及"),
                    TextSpan(
                        text: "《隐私政策》",
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            ToastUtil.showToast("点击了隐私政策");
                          }),
                  ]))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  // 创建输入框
  InputDecoration _createInputDecoration(IconData icon, String hintText) {
    return InputDecoration(
      prefixIcon: Icon(icon),
      hintText: hintText,
      border: OutlineInputBorder(),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
      // filled: true,
      // fillColor: Color(0xffaaaaaa)
    );
  }
}
