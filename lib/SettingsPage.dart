import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingsState();
  }
}

class _SettingsState extends State<SettingsPage> {
  static const Color PrimaryColor = Color(0xFF16213f);
  var _shuffleState = false;
  var _showImageState = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor,
      appBar: AppBar(
        title: Text("设置"),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              "显示轮播",
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(
              Icons.shuffle,
              color: Colors.white,
            ),
            trailing: Switch(
              value: _shuffleState,
              onChanged: (state) {
                setState(() {
                  _shuffleState = state;
                });
              },
              // inactiveThumbColor: Colors.grey,
              // inactiveTrackColor: Colors.white,
              activeColor: Colors.white,
              activeTrackColor: Colors.white,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.grey,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.image,
              color: Colors.white,
            ),
            title: Text(
              "无图模式",
              style: TextStyle(color: Colors.white),
            ),
            trailing: Switch(
              value: _showImageState,
              onChanged: (state) {
                setState(() {
                  _showImageState = state;
                });
              },
              activeColor: Colors.white,
              activeTrackColor: Colors.white,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
