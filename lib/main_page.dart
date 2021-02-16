import 'package:flutter/material.dart';
import 'package:wanandroid_demo/home/home.dart';
import 'package:wanandroid_demo/publics/public.dart';
import 'package:wanandroid_demo/questions/qeustions.dart';
import 'package:wanandroid_demo/square/squares.dart';
import 'package:wanandroid_demo/system/systems.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

import 'colors_config.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  // static const Color PrimaryColor = Color(0xFF16213f);
  // static const Color PrimaryColor = Color(0xFFBE1C2A);
  static const Color tab_color = Colors.grey;
  var _title = "首页";
  var tabs = ["首页", "广场", "公众号", "体系", "问答"];
  int _currentIndex = 0;
  BottomNavigationBar bottomNavigationBar;
  var _pages = [
    HomePage(),
    SquarePage(),
    PublicPage(),
    SystemPage(),
    QuestionPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            )),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            iconSize: 25,
            onPressed: () {},
            splashColor: Colors.transparent, // 按钮波纹颜色
            highlightColor: Colors.transparent, // 按钮按下时的背景色
          )
        ],
        brightness: Brightness.dark,
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: Container(
        color: ColorsConfig.primaryColor,
        child: _pages[_currentIndex],
      ),
      drawer: MyDrawer(),
      drawerScrimColor: ColorsConfig.primaryColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorsConfig.primaryColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.crop_square), label: "广场"),
          BottomNavigationBarItem(icon: Icon(Icons.public), label: "公众号"),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_work_outlined), label: "体系"),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer), label: "问答")
        ],
        currentIndex: _currentIndex,
        fixedColor: Colors.white, //选中的颜色
        unselectedItemColor: tab_color,
        type: BottomNavigationBarType.fixed, //选中的样式
        //选项卡切换，这种写法更容易理解
        // onTap: (index){
        //   _onItemSelected(index);
        // },
        // 这种写法更简单，但是不容易理解
        onTap: _onItemSelected,
      ),
    );
  }

  void _onItemSelected(int index) {
    setState(() {
      _currentIndex = index;
      _title = tabs[index];
    });
  }

  @override
  void initState() {
    super.initState();
  }
}

//抽屉组件

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      elevation: 0.0,
      child: Container(
        color: ColorsConfig.primaryColor,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.grey,
              child: DrawerHeader(
                child: Center(
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: CircleAvatar(
                      child: Text("R"),
                    ),
                  ),
                ),
              ),
            ),
            // ListTile 通常用于在 Flutter 中填充 ListView
            // title 参数可以接受任何小部件，但通常是文本小部件
            // subtitle副标题是标题下面较小的文本
            // dense使文本更小，并将所有内容打包在一起
            // leading将图像或图标添加到列表的开头。通常是一个图标。
            // trailing设置拖尾将在列表的末尾放置一个图像。这对于指示主-细节布局特别有用。
            // contentPadding内容边距，默认是16
            // selected如果选中列表的 item 项，那么文本和图标的颜色将成为主题的主颜色。
            // Gesture recognitionListTile 可以检测用户的点击和长按事件，onTap 为单击，onLongPress 为长按。波纹效果是内置的
            // enabled 通过将 enable 设置为 false，来禁止点击事件
            // ListTile.divideTiles  可以在 titles 之间添加分隔符，这个颜色有点淡

            ListTile(
              leading: Icon(
                Icons.card_giftcard,
                color: Colors.white,
              ),
              title: Text(
                "我的积分",
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
              ),
              // dense: true,
              // contentPadding: EdgeInsets.symmetric(horizontal: 0),
              // selected: true,
            ),
            ListTile(
              leading: Icon(
                Icons.collections,
                color: Colors.white,
              ),
              title: Text(
                "我的收藏",
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.share,
                color: Colors.white,
              ),
              title: Text(
                "我的分享",
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.read_more,
                color: Colors.white,
              ),
              title: Text(
                "稍后阅读",
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.history,
                color: Colors.white,
              ),
              title: Text(
                "阅读历史",
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: Text(
                "系统设置",
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.pushNamed(context, "SettingsPage");
              },
            ),
            ListTile(
              leading: Icon(
                Icons.account_box,
                color: Colors.white,
              ),
              title: Text(
                "关于我们",
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              title: Text(
                "退出登录",
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
              ),
              onTap: () async {
                await _showExitAppDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future _showExitAppDialog(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "提示",
          ),
          content: Text(
            "是否退出应用?",
          ),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "取消",
                )),
            FlatButton(
              onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
              child: Text(
                "退出",
              ),
            )
          ],
        );
      },
    );
  }
}
