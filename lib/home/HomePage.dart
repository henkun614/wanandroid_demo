import 'package:flutter/material.dart';
import 'package:wanandroid_demo/model/home/HomeModel.dart';

//这个页面主要知识点在于
//1 dio请求数据
//2 listview的使用(listview的几种构建方式，如何添加分割线，下拉刷新上啦加载)
//3 loading框的使用
//4 json与model互转
//5 异步UI更新
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  // static const Color PrimaryColor = Color(0xFF16213f);
  static const items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RefreshIndicator(
        // color: PrimaryColor,
        child: ListView.separated(
          // listview加载列表数据
          itemCount: items.length,
          padding: EdgeInsets.all(5),
          itemBuilder: (context, index) {
            return _showDate();
          },
          separatorBuilder: (context, index) {
            //分割线
            return Divider(
              color: Colors.white,
              thickness: 2,
            );
          },
        ),
        onRefresh: () async {
          setState(() {});
        },
        displacement: 30,
      ),
      alignment: Alignment.center,
      // color: PrimaryColor,
    );
  }

  Column _showDate() {
    return Column(
      children: [
        Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(color: Colors.red[300]),
                      top: BorderSide(color: Colors.red[300]),
                      right: BorderSide(color: Colors.red[300]),
                      bottom: BorderSide(color: Colors.red[300]))),
              child: Text(
                " 置顶 ",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Text(
              " 扔物线 ",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text(
            "android面试的黑洞-当我按下home键再切回来会发生什么？",
            style: TextStyle(color: Colors.white),
          ),
        ),
        Row(
          children: [
            Text(
              "问答",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              " - ",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "官方",
              style: TextStyle(color: Colors.white),
            )
          ],
        )
      ],
    );
  }
}
