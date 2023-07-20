import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:zaki_shop/controller/splash_controller.dart';
import 'package:sizer/sizer.dart';

class SplashPage extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe06d72),
      body: Center(
          child: LottieBuilder.asset(
        'assets/load.json',
        width: 150,
      )),
    );
  }
}
