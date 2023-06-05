import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wanandroid/router/router.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      RouteManager().navigateToReplace(RouteManager.homeRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 64.0,
            ),
            SizedBox(height: 16.0),
            Text(
              'Welcome to My App',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
