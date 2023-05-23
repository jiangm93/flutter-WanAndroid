import 'package:flutter/material.dart';
import 'package:wanandroid/router/router.dart';
import 'package:wanandroid/utils/toast_util.dart';
import 'package:wanandroid/widget/BackBtn.dart';


// class LoginPage extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() =>_LoginPageState();
//
// }
//
//
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

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackBtn(),
        centerTitle: true,
        title: Text("欢迎登录"),
        backgroundColor: Colors.white,
      ),
      body: Center(
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
              height: 44,
              child: TextField(
                decoration: InputDecoration(
                  hintText: '请输入用户名',
                  border: OutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 10.0),
                ),
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 300,
              height: 44,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '请输入密码',
                  border: OutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 10.0),
                  // filled: true,
                  // fillColor: Color(0xffaaaaaa)
                ),
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 44,
              width: 250,
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: FilledButton(
                  onPressed: () {},
                  child: Text('登录'),
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 15,right: 15),
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
                  SizedBox(width: 30,),
                  Checkbox(value: true, onChanged: (b){

                  }),
                  Text("请仔细阅读《用户协议》及《隐私政策》"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
