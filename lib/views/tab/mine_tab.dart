import 'package:flutter/material.dart';
import 'package:wanandroid/router/router.dart';

class MineTabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MineTabPageState();
}

class _MineTabPageState extends State<MineTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child:Column(

      children: [
        Text("我的"),
        ElevatedButton(onPressed: ()=>{
          RouteManager().navigateTo(RouteManager.loginRouter)
          
        }, child: Text("去登录"))
      ],
    )));
  }
}
