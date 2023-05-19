import 'package:flutter/material.dart';

class MineTabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MineTabPageState();
}

class _MineTabPageState extends State<MineTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("我的")));
  }
}
