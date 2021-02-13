import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wanandroid_demo/MainPage.dart';
import 'package:wanandroid_demo/SettingsPage.dart';
import 'package:wanandroid_demo/home/HomePage.dart';

import 'ColorsConfig.dart';
import 'app_provider.dart';

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

  Color _themeColor;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: AppInfoProvider())],
      child: Consumer<AppInfoProvider>(
        builder: (context, appinfo, _) {
          String colorKey = appinfo.themeColor;
          if (ColorsConfig.themeColorMap[colorKey] != null) {
            _themeColor = ColorsConfig.themeColorMap[colorKey];
          }
          return MaterialApp(
            title: '玩Android客户端',
            theme: ThemeData(
              primaryColor: _themeColor,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: MainPage(),
            routes: {"SettingsPage": (context) => SettingsPage()},
          );
        },
      ),
    );
  }
}
