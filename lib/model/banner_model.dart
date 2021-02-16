// To parse this JSON data, do
//
//     final banner = bannerFromJson(jsonString);

import 'dart:convert';

HomeBanner bannerFromJson(String str) => HomeBanner.fromJson(json.decode(str));

String bannerToJson(HomeBanner data) => json.encode(data.toJson());

class HomeBanner {
  HomeBanner({
    this.data,
    this.errorCode,
    this.errorMsg,
  });

  List<Datum> data;
  int errorCode;
  String errorMsg;

  factory HomeBanner.fromJson(Map<String, dynamic> json) => HomeBanner(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        errorCode: json["errorCode"],
        errorMsg: json["errorMsg"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "errorCode": errorCode,
        "errorMsg": errorMsg,
      };
}

class Datum {
  Datum({
    this.desc,
    this.id,
    this.imagePath,
    this.isVisible,
    this.order,
    this.title,
    this.type,
    this.url,
  });

  String desc;
  int id;
  String imagePath;
  int isVisible;
  int order;
  String title;
  int type;
  String url;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        desc: json["desc"],
        id: json["id"],
        imagePath: json["imagePath"],
        isVisible: json["isVisible"],
        order: json["order"],
        title: json["title"],
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "id": id,
        "imagePath": imagePath,
        "isVisible": isVisible,
        "order": order,
        "title": title,
        "type": type,
        "url": url,
      };
}
