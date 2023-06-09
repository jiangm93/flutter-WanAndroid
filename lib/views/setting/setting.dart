import 'package:flutter/material.dart';
import 'package:wanandroid/resource/app_colors.dart';
import 'package:wanandroid/router/router.dart';
import 'package:wanandroid/widget/appbar.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("系统设置",backgroundColor: Colors.white),
      backgroundColor: ThemeColors.colorF6F6F8,
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                final obj = {
                  'url':"https://app.0359tv.com/agreement/privacy/policy.html"
                };
                // Navigator.of(context).pushNamed(RouteManager.webRoute,arguments: obj);
                RouteManager().navigateTo(RouteManager.webRoute,arguments: obj);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 54,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text("用户协议", style: TextStyle(fontSize: 15)),
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
            Divider(height: 1,color: ThemeColors.colorF6F6F8,),
            GestureDetector(
              onTap: () {
                RouteManager().navigateTo(RouteManager.loginRouter);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 54,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text("隐私协议", style: TextStyle(fontSize: 15)),
                      //标题
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
            Divider(height: 1,color: ThemeColors.colorF6F6F8,),
            GestureDetector(
              onTap: () {
                RouteManager().navigateTo(RouteManager.aboutUsRoute);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 54,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child:
                          //间距
                          Text("关于我们", style: TextStyle(fontSize: 15)),
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
            Spacer(),
            ElevatedButton(onPressed: (){}, child: Text("退出登录")),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
