import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Ui {

  /**
   * 커스텀 체크박스
   */
  static Row checkBox(RxBool checkValue, {Function callback}) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            checkValue.value = !checkValue.value;
            Get.log('<======= Pedex CheckValue: ' + checkValue.value.toString());
            if (callback != null) {
              callback();
            }
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: checkValue .value? Color(0xff98CECB) : Color(0x3d000000),
                ),
                shape: BoxShape.rectangle,
                color: checkValue.value ? Color(0xff98CECB) : Colors.white,
                borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Icon(
                    Icons.check,
                    size: 15.0,
                    color: checkValue.value ? Colors.white : Color(0x3d000000),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }


  /**
   * 하단 네비게이션 버튼
   */
  static Widget bottomNavigationButton(String title, {double height=65, Function callback}) {
    if(Platform.isAndroid){
      height = height - 20;
    }
    return Container(
      height: height,
      padding: EdgeInsetsDirectional.only(bottom: 0),
      decoration:
      BoxDecoration(
        color: Color(0xff00a59d),
      ),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Get.theme.colorScheme.secondary.withOpacity(0.08),
        child: Center(
          child: Text(title,
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: Color(0xffffffff),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0,

                )
          ),
        ),
        onTap: () async {
          if (callback != null) {
            await callback();
          }
        },
      )
    );
  }


  static Color parseColor(String hexCode, {double opacity}) {
    try {
      return Color(int.parse(hexCode.replaceAll("#", "0xFF"))).withOpacity(opacity ?? 1);
    } catch (e) {
      return Color(0xFFCCCCCC).withOpacity(opacity ?? 1);
    }
  }

  static GetBar ErrorSnackBar({String title = 'Error', String message}) {
    Get.log("[$title] $message", isError: true);
    return GetBar(
      titleText: Text(title.tr, style: Get.textTheme.headline6.merge(TextStyle(color: Get.theme.primaryColor))),
      messageText: Text(message, style: Get.textTheme.caption.merge(TextStyle(color: Get.theme.primaryColor))),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(20),
      backgroundColor: Colors.redAccent,
      icon: Icon(Icons.remove_circle_outline, size: 32, color: Get.theme.primaryColor),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: Duration(seconds: 5),
    );
  }


  /**
   * 업로드된 이미지 보여주기
   */
  static CachedNetworkImage mocarImage(String imageUrl)  {
    // String _url = Get.find<GlobalService>().global.value.laravelBaseUrl;
    // String _apiPath = Get.find<GlobalService>().global.value.apiPath;
    return CachedNetworkImage(
      imageUrl: '${imageUrl}',
      //httpHeaders: {"authorization": 'Bearer ${Get.find<AuthService>().user.value.jwtToken}'},
      // placeholder: (context, url) => new CircularProgressIndicator(),
      progressIndicatorBuilder: (context, url, progress) => Center(
        child: CircularProgressIndicator(
          value: progress.progress,
          color: Colors.white,
        ),
      ),
      errorWidget: (context, url, error) => new Icon(Icons.error, color: Colors.white),
      fadeOutDuration: const Duration(seconds: 1),
      fadeInDuration: const Duration(seconds: 2),
    );

  }
}
