import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:wanandroid/router/router.dart';
import 'package:wanandroid/view/home.dart';

void main() {
  runApp(const MyApp());
  //白色
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,//背景色
      statusBarIconBrightness:Brightness.dark//字体颜色
  ));

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
      navigatorKey: RouteManager.navigatorKey,
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
