import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:wanandroid_demo/MainPage.dart';
import 'package:wanandroid_demo/SettingsPage.dart';

import 'ColorsConfig.dart';

void main() {
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
      title: '玩Android客户端',
      theme: ThemeData(
        primaryColor: ColorsConfig.primaryColor,
      ),
      home: MainPage(),
      routes: {"SettingsPage": (context) => SettingsPage()},
    );
  }
}
