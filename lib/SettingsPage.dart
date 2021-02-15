import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'ColorsConfig.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingsState();
  }
}

class _SettingsState extends State<SettingsPage> {
  // static const Color PrimaryColor = Color(0xFF16213f);

  var _showShuffleState = true;
  var _showImageState = false;
  var _showTopState = true;
  var _titleStyle = TextStyle(color: Colors.white); //标题颜色
  var _subTtitleStyle = TextStyle(color: Colors.grey); //子标题颜色
  var _cacheSize = "0.0"; //缓存大小

  String themeColor;
  String _colorKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        color: _colorKey == null
            ? ColorsConfig.themeColorMap[themeColor]
            : ColorsConfig.themeColorMap[_colorKey],
        child: Column(
          children: [
            ListTile(
              title: _text("显示轮播"),
              subtitle: _subTitle("关闭之后不显示首页轮播"),
              trailing: _switch("_showShuffleState", _showShuffleState),
            ),
            ListTile(
              title: _text("无图模式"),
              subtitle: _subTitle("开启之后只在WiFi下展示图片"),
              trailing: _switch("_showImageState", _showImageState),
            ),
            ListTile(
              title: _text("显示置顶"),
              subtitle: _subTitle("关闭之后不显示置顶文章"),
              trailing: _switch("_showTopState", _showTopState),
            ),
            ListTile(
              title: _text("清除缓存"),
              subtitle: _subTitle("清除应用运行过程中的缓存数据"),
              trailing: Text(
                _cacheSize,
                style: _subTtitleStyle,
              ),
            ),
            ListTile(
              title: _text("列表动画"),
              subtitle: _subTitle("列表加载数据的动画效果"),
              trailing: _icon(),
            ),
            ListTile(
              title: _text("主题颜色"),
              subtitle: _subTitle("更换背景颜色"),
              trailing: _icon(),
              onTap: () {
                // _showModalBottomSheet();
              },
            ),
            ListTile(
              title: _text("关于我们"),
              subtitle: _subTitle("APP的相关信息"),
              trailing: _icon(),
            )
          ],
        ),
      ),
    );
  }

  //单选开关
  Switch _switch(String stateStr, bool state) {
    return Switch(
      value: state,
      onChanged: (_state) {
        setState(() {
          switch (stateStr) {
            case "_showShuffleState":
              _showShuffleState = _state;
              break;
            case "_showImageState":
              _showImageState = _state;
              break;
            case "_showTopState":
              _showTopState = _state;
              break;
            default:
          }
        });
      },
      activeColor: Colors.white,
      activeTrackColor: Colors.white,
      inactiveThumbColor: Colors.grey,
      inactiveTrackColor: Colors.grey,
    );
  }

  @override
  void initState() {
    super.initState();
    _getCount();
    // _initTheme();
  }

  // 加载缓存
  Future<String> loadCache() async {
    Directory tempDir = await getTemporaryDirectory();
    double value = await _getTotalSizeOfFilesInDir(tempDir);
    /*tempDir.list(followLinks: false,recursive: true).listen((file){
          //打印每个缓存文件的路径
        print(file.path);
      });*/
    // print('临时目录大小: ' + value.toString());
    return _renderSize(value);
  }

  // 循环计算文件的大小（递归）
  Future<double> _getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
    if (file is File) {
      int length = await file.length();
      return double.parse(length.toString());
    }
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      double total = 0;
      if (children != null)
        for (final FileSystemEntity child in children)
          total += await _getTotalSizeOfFilesInDir(child);
      return total;
    }
    return 0;
  }

  // 递归方式删除目录
  Future<Null> _delDir(FileSystemEntity file) async {
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      for (final FileSystemEntity child in children) {
        await _delDir(child);
      }
    }
    await file.delete();
  }

  // 计算大小
  _renderSize(double value) {
    if (null == value) {
      return 0;
    }
    List<String> unitArr = List()..add('B')..add('K')..add('M')..add('G');
    int index = 0;
    while (value > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(2);
    if (size == '0.00') {
      return '0M';
    }
    // print('size:${size == 0}\n ==SIZE${size}');
    return size + unitArr[index];
  }

  void _getCount() async {
    var cache = await loadCache();

    setState(() {
      _cacheSize = cache;
    });
  }

//icon
  Icon _icon() {
    return Icon(
      Icons.chevron_right,
      color: Colors.white,
    );
  }

  //title
  Text _text(String title) {
    return Text(
      title,
      style: _titleStyle,
    );
  }

//subtitle
  Text _subTitle(String sub) {
    return Text(
      sub,
      style: _subTtitleStyle,
    );
  }

  // 弹出底部菜单列表模态对话框
  // Future<int> _showModalBottomSheet() {
  //   return showModalBottomSheet<int>(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Container(
  //         padding: EdgeInsets.all(8),
  //         child: Wrap(
  //           spacing: 8,
  //           runSpacing: 8,
  //           children: ColorsConfig.themeColorMap.keys.map((key) {
  //             Color value = ColorsConfig.themeColorMap[key];
  //             return InkWell(
  //               // onTap: () {
  //               //   setState(() {
  //               //     _colorKey = key;
  //               //   });
  //               //   SpUtil.putString('key_theme_color', key);
  //               //   Provider.of<AppInfoProvider>(context, listen: false)
  //               //       .setTheme(key);
  //               // },
  //               child: Container(
  //                 width: 40,
  //                 height: 40,
  //                 color: value,
  //                 child: _colorKey == key
  //                     ? Icon(
  //                         Icons.done,
  //                         color: Colors.white,
  //                       )
  //                     : null,
  //               ),
  //             );
  //           }).toList(),
  //         ),
  //       );
  //     },
  //   );
  // }

  // Future _initTheme() async {
  //   await SpUtil.getInstance();
  //   themeColor = SpUtil.getString("key_theme_color", defValue: "blue");
  // }
}
