
import 'package:flutter/material.dart';
import 'package:wanandroid/api/api.dart';
import 'package:wanandroid/model/home_banner_model.dart';
import 'package:wanandroid/net/http_request.dart';

class HomeTabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {

  @override
  void initState() {
    HttpRequest.request<List<HomeBannerModel>>(Api.HOME_BANNER,isShowLoading: true, data: {},
        onSuccess: (result) {
          print(result.length);

        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("主页")),);
  }
}
