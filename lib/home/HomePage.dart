import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const Color PrimaryColor = Color(0xFF16213f);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: PrimaryColor,
      child: Text(
        "首页",
        style: TextStyle(color: Colors.white),
      ),
      alignment: Alignment.center,
    );
  }
}
