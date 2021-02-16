import 'package:flutter/material.dart';

class PublicPage extends StatelessWidget {
  // static const Color PrimaryColor = Color(0xFF16213f);
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: PrimaryColor,
      child: Text(
        "公众号",
        style: TextStyle(color: Colors.white),
      ),
      alignment: Alignment.center,
    );
  }
}
