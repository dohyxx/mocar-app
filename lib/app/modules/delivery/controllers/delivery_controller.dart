import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/common/util.dart';
import 'package:mocar_test/app/models/delivery/delivery.dart';
import 'package:mocar_test/app/models/enum.dart';
import 'package:mocar_test/app/repositories/delivery_repository.dart';
import 'package:mocar_test/app/services/driver_work_service.dart';
import 'package:mocar_test/app/services/settings_service.dart';
import 'package:webview_flutter/webview_flutter.dart';


class DeliveryController extends GetxController with GetSingleTickerProviderStateMixin {

  // GlobalKey<FormState> loginFormKey;
  final isContentLoading = true.obs;
  final Completer<WebViewController> complete = Completer<WebViewController>();

  ScrollController scrollController;
  WebViewController webView;
  WebViewController webDetailView;
  DeliveryRepository deliveryRepository;


  var deliveryList = <Delivery>[].obs;    //배송예약 리스트
  Delivery deliveryDay;    //오늘 배송예약
  var delTotalCnt = 0.obs;                //총 배송예약 건수
  var delTotalCost = 0.obs;               //총 금액
  var deliveryId = 0.obs; //맵 경로 ID

  //TODO:: 드랍다운 텍스트 수정 필요
  var assignedTask = '진행상태'.obs;
  final rolesList = ['진행상태1', '진행상태2', '진행상태3'].obs;


  DeliveryController(){
    scrollController = new ScrollController();
    deliveryRepository = new DeliveryRepository();
  }


  @override
  void onInit() {
    //loginFormKey = new GlobalKey<FormState>();
    super.onInit();
    onRefresh();
  }


  /**
   * 새로고침
   */
  void onRefresh() async {
    isContentLoading.value = true;
    await getDeliveryList();

    Future.delayed(Duration(milliseconds: 600)) .then((onValue)
    => isContentLoading.value = false);
  }


  /**
   *  배송예약 목록 조회
   */
  void getDeliveryList() async {
    try {
      deliveryList.clear();
      deliveryDay = new Delivery();
      delTotalCnt.value = 0;
      delTotalCost.value = 0;

      Map<String, dynamic> data = await Get.find<DriverWorkService>().getDeliveryList();
      deliveryList.addAll(data['deliveryList']);
      delTotalCnt.value = data['totalCnt'];
      Util.print('[배송예약 목록]: ${deliveryList.toString()}');

      //총 금액
      deliveryList.forEach((element) {
        delTotalCost.value += element.totalAmount;
      });

      for(var i=0; i<deliveryList.length; i++){
        var routeCnt = 0.obs;
          for(var j=0; j<deliveryList[i].deliveryDetail.length; j++){
            //상하차지만 리스트에 추가
            if(deliveryList[i].deliveryDetail[j].nodeTypeCd.codeKey == 'S'){
              deliveryList[i].deliveryDetail.removeAt(j);
            }
            //경유지 수
            if(deliveryList[i].deliveryDetail[j].nodeTypeCd.codeKey == 'P'){
              routeCnt.value++;
              deliveryList[i].routeCnt = routeCnt.value-1;
              //Util.print('경유지 수: ${deliveryList[i].routeCnt.toString()}');
            }
          }
        //오늘 배송
        if(deliveryList[i].pickUpDate == Util.dateForm(Get.find<SettingsService>().today, type: 2)){
          deliveryDay = deliveryList[i];
          Util.print('[오늘 배송예약]: ' + deliveryDay.toString());
        }
      }

    } catch (e) {
      Util.print(e);
    }
  }


  void isSetContentLoading(){
    isContentLoading.value = true;
    Future.delayed(Duration(milliseconds: 800)) .then((onValue)
    => isContentLoading.value = false);
  }
}