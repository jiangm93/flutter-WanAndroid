import 'package:flutter/material.dart';
import 'package:wanandroid/router/router.dart';
import 'package:wanandroid/utils/hex_color.dart';
import 'package:wanandroid/utils/toast_util.dart';
import 'package:wanandroid/widget/appbar.dart';

class MineTabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MineTabPageState();
}

class _MineTabPageState extends State<MineTabPage> {
  var headUrl =
      "http://pics5.baidu.com/feed/622762d0f703918f751ba5e950ce8d915beec4c1.jpeg?token=ed435fd18c71cf7ca7a011acb70460f7";

  // child: Image.network('http://pics5.baidu.com/feed/622762d0f703918f751ba5e950ce8d915beec4c1.jpeg?token=ed435fd18c71cf7ca7a011acb70460f7',width: 100,height: 100,),
  // borderRadius:BorderRadius.circular(20)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#EEEEEE"),
        appBar: appBar("个人中心"),
        body: Center(
            child: Column(
          children: [
            SizedBox(height: 30,),
            Column(
              children: [
                ClipRRect(
                  child: Image.network(
                    headUrl,
                    width: 60,
                    height: 60,
                  ),
                  borderRadius: BorderRadius.circular(60),
                ),
                SizedBox(height: 10,),
                Text(
                  "用户名",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                //交叉轴的布局方式，对于column来说就是水平方向的布局方式
                crossAxisAlignment: CrossAxisAlignment.center,
                //就是字child的垂直布局方向，向上还是向下
                verticalDirection: VerticalDirection.down,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: GestureDetector(
                      child: Column(
                        children: [
                          Icon(Icons.integration_instructions),
                          Text("积分")
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: GestureDetector(
                        child: Column(
                          children: [Icon(Icons.show_chart), Text("排名")],
                        ),
                        onTap: () {},
                      )),
                  // Padding(
                  //     padding: EdgeInsets.only(left: 20, right: 20),
                  //     child: GestureDetector(
                  //       child: Column(
                  //         children: [
                  //           Icon(Icons.integration_instructions),
                  //           Text("收藏")
                  //         ],
                  //       ),
                  //       onTap: () {},
                  //     )),
                  // Padding(
                  //     padding: EdgeInsets.only(left: 20, right: 20),
                  //     child: GestureDetector(
                  //       child: Column(
                  //         children: [
                  //           Icon(Icons.integration_instructions),
                  //           Text("积分")
                  //         ],
                  //       ),
                  //       onTap: () {},
                  //     ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 54,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.collections),
                          //添加安全判断
                          SizedBox(
                            width: 15,
                          ),
                          //间距
                          Text("我的收藏", style: TextStyle(fontSize: 15)),
                          //标题
                        ],
                      ),
                    ), //left
                    Container(
                      child: Row(
                        children: <Widget>[Icon(Icons.chevron_right)],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 54,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.settings),
                          //添加安全判断
                          SizedBox(
                            width: 15,
                          ),
                          //间距
                          Text(
                            "设置",
                            style: TextStyle(fontSize: 15),
                          ),
                          //标题
                        ],
                      ),
                    ), //left
                    Container(
                      child: Row(
                        children: <Widget>[Icon(Icons.chevron_right)],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text("我的"),
            ElevatedButton(
                onPressed: () =>
                    {RouteManager().navigateTo(RouteManager.loginRouter)},
                child: Text("去登录"))
          ],
        )));
  }
}
