import 'package:flutter/material.dart';
import 'dart:async';
import 'colors_config.dart';

//启动页

class SpalashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      //Stack层叠布局
      alignment: AlignmentDirectional.topEnd,
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: ColorsConfig.primaryColor,
          alignment: AlignmentDirectional.center,
          child: Text(
            "技术连接世界",
            style:
                TextStyle(color: Colors.white, decoration: TextDecoration.none),
          ),
        ),
        Positioned(
          child: CountDownWidget(),
          top: 30,
          right: 20,
          width: 60,
          height: 30,
        )
      ],
    );
  }
}

//倒计时 跳过 组件
class CountDownWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CountDownWidgetState();
  }
}

class CountDownWidgetState extends State<CountDownWidget> {
  //倒计时起始时间
  int _countTime = 5;
  //计时器
  Timer _timer;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.white)),
      child: GestureDetector(
        child: Text(
          "跳过",
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            decoration: TextDecoration.none,
          ),
          textDirection: TextDirection.ltr,
        ),
        onTap: () {
          _timer.cancel();
          Navigator.pushNamed(context, "MainPage");
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startCountDownTime();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }

//倒计时功能
  void _startCountDownTime() {
    //计时器刷新频率，每隔1s刷新一次
    const dura = Duration(seconds: 1);
    var callback = (timer) => {
          setState(() {
            if (_countTime < 1) {
              //取消倒计时，并且跳转到首页
              _timer.cancel();
              Navigator.pushNamed(context, "MainPage");
            } else {
              _countTime--;
            }
          })
        };
    //计时器实例
    _timer = Timer.periodic(dura, callback);
  }
}
