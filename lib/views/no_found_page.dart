
import 'package:flutter/material.dart';
import 'package:wanandroid/resource/app_colors.dart';
import 'package:wanandroid/widget/appbar.dart';

class NoFoundPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: ThemeColors.colorF6F6F8,
     appBar: appBar("未找到相关页面"),
     body: Center(
       child: Column(
         children: [
           SizedBox(height: 200,),
           Image(
             width: 200,
               height: 200,
               image: AssetImage("assets/images/no_found_page.png"))
           
         ],
       ),
     ),
   );
  }
  
}