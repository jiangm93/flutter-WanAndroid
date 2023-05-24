import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/widget/BackBtn.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackBtn(),
        centerTitle: true,
        title: Text("注册"),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
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
                  child: Text('注册'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
