import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
  List<Image> imgs = [
    Image.network(
      "https://wanandroid.com/blogimgs/8690f5f9-733a-476a-8ad2-2468d043c2d4.png",
      fit: BoxFit.cover,
    ),
    Image.network(
        "https://www.wanandroid.com/blogimgs/62c1bd68-b5f3-4a3c-a649-7ca8c7dfabe6.png",
        fit: BoxFit.cover),
    Image.network(
        "https://www.wanandroid.com/blogimgs/50c115c2-cf6c-4802-aa7b-a4334de444cd.png",
        fit: BoxFit.cover),
    Image.network(
        "https://www.wanandroid.com/blogimgs/90c6cc12-742e-4c9f-b318-b912f163b8d0.png",
        fit: BoxFit.cover)
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          child: Swiper(
            itemWidth: double.infinity,
            itemHeight: 200,
            itemCount: imgs.length,
            itemBuilder: (BuildContext context, int index) {
              return imgs[index];
            },
            autoplay: true,
            pagination: new SwiperPagination(
              builder: SwiperPagination.fraction,
            ),
            control: new SwiperControl(),
          ),
        ),
        // ListView.separated(
        //     itemBuilder: null, separatorBuilder: null, itemCount: null)
      ],
    );
  }

  // Column _showDate() {
  //   return Column(
  //     children: [
  //       Row(
  //         children: [
  //           DecoratedBox(
  //             decoration: BoxDecoration(
  //                 border: Border(
  //                     left: BorderSide(color: Colors.red[300]),
  //                     top: BorderSide(color: Colors.red[300]),
  //                     right: BorderSide(color: Colors.red[300]),
  //                     bottom: BorderSide(color: Colors.red[300]))),
  //             child: Text(
  //               " 置顶 ",
  //               style: TextStyle(color: Colors.white),
  //             ),
  //           ),
  //           Text(
  //             " 扔物线 ",
  //             style: TextStyle(color: Colors.white),
  //           ),
  //         ],
  //       ),
  //       ListTile(
  //         contentPadding: EdgeInsets.all(0),
  //         title: Text(
  //           "android面试的黑洞-当我按下home键再切回来会发生什么？",
  //           style: TextStyle(color: Colors.white),
  //         ),
  //       ),
  //       Row(
  //         children: [
  //           Text(
  //             "问答",
  //             style: TextStyle(color: Colors.white),
  //           ),
  //           Text(
  //             " - ",
  //             style: TextStyle(color: Colors.white),
  //           ),
  //           Text(
  //             "官方",
  //             style: TextStyle(color: Colors.white),
  //           )
  //         ],
  //       )
  //     ],
  //   );
  // }
}
