import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wanandroid_demo/http.dart';
import 'package:wanandroid_demo/model/banner_model.dart';

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
  List<Image> imgs = [];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          child: FutureBuilder(
            future: dio.get("/banner/json"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Response response = snapshot.data;
                Map bannerMap = json.decode(response.toString());
                var banner = HomeBanner.fromJson(bannerMap);
                if (snapshot.hasError) {
                  Fluttertoast.showToast(msg: snapshot.error.toString());
                } else {
                  return _getSwiper(banner.data);
                  // Fluttertoast.showToast(msg: banner.data[0].title);
                }
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ],
    );
  }

  //根据接口返回的数据生成轮播图
  Swiper _getSwiper(List<Datum> data) {
    imgs.clear();
    for (var i = 0; i < data.length; i++) {
      var image = Image.network(
        data[i].imagePath,
        fit: BoxFit.cover,
      );
      imgs.add(image);
    }
    return Swiper(
      itemWidth: double.infinity,
      itemHeight: 200,
      itemCount: imgs.length,
      itemBuilder: (BuildContext context, int index) {
        return imgs[index];
      },
      autoplay: true,
      pagination: new SwiperPagination(
        builder: SwiperPagination.dots,
      ),
      control: new SwiperControl(),
    );
  }
}
