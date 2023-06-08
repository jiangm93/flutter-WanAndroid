

import 'package:flutter/material.dart';
import 'package:wanandroid/resource/app_colors.dart';
import 'package:wanandroid/widget/appbar.dart';

class AboutUsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.colorF6F6F8,
      appBar: appBar("关于我们"),
      body: Center(
        child:Column(
          children: [

            SizedBox(height: 200,),
            FlutterLogo(
              size: 150,
            ),
            SizedBox(height: 10,),
            Text("玩android",style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Text("版本V1.0.0")
          ],
        ) ,
      ),
    );
  }

}