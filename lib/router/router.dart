import 'package:flutter/material.dart';
import 'package:wanandroid/application.dart';
import 'package:wanandroid/views/home.dart';
import 'package:wanandroid/views/login/login.dart';
import 'package:wanandroid/views/login/register.dart';
import 'package:wanandroid/views/no_found_page.dart';
import 'package:wanandroid/views/setting/about_us.dart';
import 'package:wanandroid/views/setting/setting.dart';
import 'package:wanandroid/views/splash_screen.dart';
import 'package:wanandroid/views/web/web_page.dart';

class RouteManager {
  static final RouteManager _singleton = RouteManager._internal();

  factory RouteManager() {
    return _singleton;
  }

  RouteManager._internal();

  // static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static const String initialRoute = '/';
  static const String noFoundRoute = '/nofound';
  static const String homeRoute = '/home';
  static const String loginRouter = '/login';
  static const String registerRouter = '/login/register';
  static const String detailRoute = '/detail';
  static const String settingsRoute = '/settings';
  static const String aboutUsRoute = '/settings/about';
  static const String webRoute = '/web';

  static Map<String, WidgetBuilder> routes = {
    initialRoute: (context, {arguments}) => SplashScreenPage(),
    noFoundRoute: (context, {arguments}) => NoFoundPage(),
    homeRoute: (context, {arguments}) => HomePage(),
    loginRouter: (context, {arguments}) => LoginPage(),
    registerRouter: (context, {arguments}) => RegisterPage(),
    detailRoute: (context, {arguments}) => HomePage(),
    settingsRoute: (context, {arguments}) => SettingPage(),
    aboutUsRoute: (context, {arguments}) => AboutUsPage(),
    webRoute: (context, {arguments}) => WebViewPage(arguments: arguments),
  };

  static Route<T> onGenerateRoute<T extends Object>(RouteSettings settings) {
    final String? name = settings.name;
    final Function pageContentBuilder = routes[name] as Function;
    print('------>路由名字:$name    ----->路由参数：${settings.arguments}');
    if (pageContentBuilder != null) {
      if (settings.arguments != null) {
        return MaterialPageRoute<T>(
            settings: settings,
            builder: (context) =>
                pageContentBuilder(context, arguments: settings.arguments));
      } else {
        return MaterialPageRoute<T>(
            settings: settings,
            builder: (context) => pageContentBuilder(context));
      }
    }
    return MaterialPageRoute<T>(
        settings: settings,
        builder: (context) =>
        routes[noFoundRoute]!(context));
  }

  static Route<T> onUnknownRoute<T extends Object>(RouteSettings settings) {
    return MaterialPageRoute<T>(
      settings: settings,
      builder: (context) {
        return routes[noFoundRoute]!(context);
      },
    );
  }

  static List<Route<dynamic>> onGenerateInitialRoutes(String initialRouteName) {
    return [
      MaterialPageRoute(builder: (context) => SplashScreenPage()),
    ];
  }

  Future<Object?>? navigateTo(String routeName, {Object? arguments}) {
    return Application.globalKey?.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  Future<Object?>? navigateToReplace(String routeName, {Object? arguments}) {
    return Application.globalKey?.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments);
  }

  void navigateBack() {
    return Application.globalKey?.currentState?.pop();
  }
}
