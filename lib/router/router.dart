
import 'package:flutter/material.dart';
import 'package:wanandroid/view/home.dart';
import 'package:wanandroid/view/login/login.dart';
import 'package:wanandroid/view/login/register.dart';
import 'package:wanandroid/view/splash_screen.dart';

class RouteManager {
  static final RouteManager _singleton = RouteManager._internal();

  factory RouteManager() {
    return _singleton;
  }

  RouteManager._internal();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static const String initialRoute = '/';
  static const String homeRoute = '/home';
  static const String loginRouter = '/login';
  static const String registerRouter = '/login/register';
  static const String detailRoute = '/detail';
  static const String settingsRoute = '/settings';

  static Map<String, WidgetBuilder> routes = {
    initialRoute: (context) => SplashScreenPage(),
    homeRoute: (context) => HomePage(),
    loginRouter: (context) => LoginPage(),
    registerRouter: (context) => RegisterPage(),
    detailRoute: (context) => HomePage(),
    settingsRoute: (context) => HomePage(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (context) => SplashScreenPage());
      case homeRoute:
        return MaterialPageRoute(builder: (context) => HomePage());
      case loginRouter:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case registerRouter:
        return MaterialPageRoute(builder: (context) => RegisterPage());
      case detailRoute:
        return MaterialPageRoute(builder: (context) => HomePage());
      case settingsRoute:
        return MaterialPageRoute(builder: (context) => HomePage());
      default:
        return MaterialPageRoute(builder: (context) => HomePage());
    }
  }

  static List<Route<dynamic>> onGenerateInitialRoutes(String initialRouteName) {
    return [
      MaterialPageRoute(builder: (context) => SplashScreenPage()),
    ];
  }

  Future<Object?>? navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  Future<Object?>? navigateToReplace(String routeName, {Object? arguments}) {
    return navigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments);
  }

  void navigateBack() {
    return navigatorKey.currentState?.pop();
  }
}
