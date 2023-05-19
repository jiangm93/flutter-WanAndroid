import 'package:flutter/material.dart';
import 'package:wanandroid/view/tab/home_tab.dart';
import 'package:wanandroid/view/tab/information_tab.dart';
import 'package:wanandroid/view/tab/mine_tab.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _widgetList = [HomeTabPage(), InformationTabPage(), MineTabPage()];
  final List _titleList = ["主页", "资讯", "我的"];
  int _tabIndex = 0;

  void changeTab(index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetList[_tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabIndex,
        onTap: (index) {
          changeTab(index);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: _titleList[0]),
          BottomNavigationBarItem(
              icon: Icon(Icons.newspaper), label: _titleList[1]),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: _titleList[2])
        ],
      ),
    );
  }
}
