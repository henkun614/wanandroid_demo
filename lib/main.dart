import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wanandroid_demo/http.dart';

import 'package:wanandroid_demo/main_page.dart';
import 'package:wanandroid_demo/settings.dart';
import 'package:wanandroid_demo/splash.dart';

import 'colors_config.dart';

void main() {
  //统一配置dio
  dio.options.baseUrl = "https://www.wanandroid.com";
  dio.options.connectTimeout = 5000;
  dio.options.receiveTimeout = 3000;
  dio.options.responseType = ResponseType.json;

  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // static const PrimaryColor = const Color(0xFF16213f);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '玩Android客户端',
      theme: ThemeData(
        primaryColor: ColorsConfig.primaryColor,
      ),
      home: SpalashPage(),
      routes: {
        "SettingsPage": (context) => SettingsPage(),
        "MainPage": (context) => MainPage()
      },
    );
  }
}
