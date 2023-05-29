

import 'package:alice_lightweight/alice.dart';
import 'package:flutter/material.dart';

class Application {
  ///应用全局 key
  static GlobalKey<NavigatorState>? globalKey;
  static OverlayEntry? network;
  /// 默认不代理  可用于抓包
  static bool proxy = false;
  static Alice? alice;
  /// 是否测试 可打印日志
  static const debug = true;
}