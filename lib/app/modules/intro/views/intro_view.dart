import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/common/images.dart';

import '../controllers/intro_controller.dart';

class IntroView extends GetView<IntroController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.put(IntroController());

    // 하단바 색상 지정
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
      // statusBarColor: Colors.black, // status bar color
    ));

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  Images.splashLogo,
                  width: 125,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Text(
          '©All rights reserved.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xffaaaaaa),
            fontSize: 12,
            fontFamily: 'NotoSansKR',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
