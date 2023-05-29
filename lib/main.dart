import 'dart:async';

import 'package:alice_lightweight/alice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:wanandroid/application.dart';
import 'package:wanandroid/net/http_manager.dart';
import 'package:wanandroid/router/router.dart';
import 'package:wanandroid/views/home.dart';

void main() {
  /// 捕获flutter能try catch 捕获的异常
  /// 还有一些异常是try catch 捕获不到的  用runZoned
  FlutterError.onError = (FlutterErrorDetails errorDetails) {
    if (Application.debug) {
      /// 测试环境 日志直接打印子啊控制台
      FlutterError.dumpErrorToConsole(errorDetails);
    } else {
      /// 在生产环境上 重定向到runZone 处理
      Zone.current
          .handleUncaughtError(errorDetails.exception, errorDetails.stack!);
    }
    reportErrorAndLog(errorDetails);
  };
  WidgetsFlutterBinding.ensureInitialized();
  GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
  Application.globalKey = globalKey;

  /// dio 网络抓包工具配置
  Alice alice = Alice(navigatorKey: globalKey);
  Application.alice = alice;

  /// 初始化网络配置
  HttpManager.initNet();



  runApp(const MyApp());
  //白色
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,//背景色
      statusBarIconBrightness:Brightness.dark//字体颜色
  ));

}

void reportErrorAndLog(FlutterErrorDetails errorDetails) {
  /// 错误日志上报 服务器
}

/// 构建错误信息
FlutterErrorDetails makeDetails(Object obj, StackTrace stack) {
  FlutterErrorDetails details =
  FlutterErrorDetails(stack: stack, exception: obj);
  return details;
}

final RouteManager routeManager = RouteManager();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true),
      initialRoute: RouteManager.initialRoute,
      onGenerateInitialRoutes: RouteManager.onGenerateInitialRoutes,
      routes: RouteManager.routes,
      navigatorKey: Application.globalKey,
      builder: EasyLoading.init(),
      // home: TabWidget(),
    );
  }
}

class TabWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  final List _widgetList = [HomePage(), HomePage(), HomePage()];
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   // title: Text(widget.title),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
