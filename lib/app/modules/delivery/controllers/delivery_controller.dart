import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/models/delivery/delivery.dart';
import 'package:mocar_test/app/models/enum.dart';
import 'package:mocar_test/app/repositories/delivery_repository.dart';
import 'package:mocar_test/app/services/driver_work_service.dart';
import 'package:webview_flutter/webview_flutter.dart';


class DeliveryController extends GetxController with GetSingleTickerProviderStateMixin {

  // GlobalKey<FormState> loginFormKey;
  final isContentLoading = true.obs;
  ScrollController scrollController;
  WebViewController webView;
  WebViewController webDetailView;
  final Completer<WebViewController> complete = Completer<WebViewController>();

  DeliveryRepository deliveryRepository;
  var deliveryList = <Delivery>[].obs;
  var delTotalCnt = 0.obs;                //총 배송예약 건수
  var delTotalCost = 0.obs;

  var deliveryId = 0.obs; //맵 경로 ID

  //드랍다운
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
      delTotalCnt.value = 0;
      delTotalCost.value = 0;

      Map<String, dynamic> data = await Get.find<DriverWorkService>().getDeliveryList();
      deliveryList.addAll(data['deliveryList']);
      delTotalCnt.value = data['totalCnt'];

      deliveryList.forEach((element) {
        delTotalCost.value += element.totalAmount;
      });

      for(var i=0; i<deliveryList.length; i++){
        for(var j=0; j<deliveryList[i].deliveryDetail.length; j++){
          if(deliveryList[i].deliveryDetail[j].nodeTypeCd.codeKey == 'S'){
            //Util.print('## deliveryList[${i}].deliveryDetail[${j}].nodeTypeCd.codeKey: ${deliveryList[i].deliveryDetail[j].nodeTypeCd.codeKey}');
            //Util.print('## deliveryList[${i}].deliveryDetail.removeAt(${j}): ${j}');
            deliveryList[i].deliveryDetail.removeAt(j);

          }
        }
      }
      Get.log('<===== 배송예약 목록 조회 in Controller : ' + deliveryList.toString());

    } catch (e) {
      Get.log(e.toString());
    }
  }


  void isSetContentLoading(){
    isContentLoading.value = true;
    Future.delayed(Duration(milliseconds: 800)) .then((onValue)
    => isContentLoading.value = false);
  }
}