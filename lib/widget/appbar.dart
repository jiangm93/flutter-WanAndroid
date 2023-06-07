import 'package:flutter/material.dart';

appBar(String title,
    {bool isShowBack = false,
    String? rightTitle,
    Color? backgroundColor,
    VoidCallback? rightButtonClick}) {
  return AppBar(
    centerTitle: true,
    titleSpacing: 0,
    leading: isShowBack == true ? BackButton() : null,
    // 返回按钮
    title: Text(
      title,
      style: TextStyle(fontSize: 18),
    ),
    backgroundColor: backgroundColor,
    // 标题
    actions: [
      if (rightTitle != null)
        InkWell(
          onTap: rightButtonClick, // 点击事件
          child: Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            alignment: Alignment.center,
            child: Text(
              rightTitle,
              style: TextStyle(fontSize: 18, color: Colors.grey[500]),
              textAlign: TextAlign.center,
            ),
          ),
        )
    ],
  );
}
