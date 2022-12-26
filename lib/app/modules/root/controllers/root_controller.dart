import 'dart:async';

import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mocar_test/app/common/ui.dart';
import 'package:mocar_test/app/common/util.dart';
import 'package:mocar_test/app/models/alarm/alarm.dart';
import 'package:mocar_test/app/models/cost/cost.dart';
import 'package:mocar_test/app/models/enterprise.dart';
import 'package:mocar_test/app/models/vehicle_model.dart';
import 'package:mocar_test/app/modules/delivery/controllers/delivery_controller.dart';
import 'package:mocar_test/app/services/driver_work_service.dart';


class RootController extends GetxController with GetSingleTickerProviderStateMixin {

  final isContentLoading = true.obs;
  ScrollController scrollController;

  GetStorage _box = new GetStorage();


  var monthCostList = <Cost>[].obs;     //월별정산 리스트
  var alarmList = <Alarm>[].obs;        //알림 리스트
  var vehicle = Vehicle().obs;          //차량 정보
  var enterprise = Enterprise().obs;    //업체 정보
  var monthTotalCost = 0.obs;           //월별 총 운임료
  var delCnt = 0.obs;                   //배송예약 건수
  var costCnt = 0.obs;                  //월별정산 건수
  var alarmCnt = 0.obs;                 //알림내역 갯수
  var noticeCnt = 0.obs;                //전체공지 갯수
  var photoCnt = 0.obs;                 //완료사진 갯수
  var routCnt = 0.obs;                  //경로맵 갯수

  //메인 토글
  final toggleYn = 0.obs;
  final isExpanded = false.obs;


  RootController(){
    scrollController = new ScrollController();
  }


  @override
  void onInit() {
    super.onInit();

    Get.put(DeliveryController());
    onRefresh();
  }


  /**
   * 새로고침
   */
  void onRefresh() async {
    isContentLoading.value = true;
    await getMonthCost();
    await getNoticeCnt();
    await getDeliveryCnt();
    await getAlarmList();
    await getVehicleInfo();
    await getEnterpriseInfo();

    isContentLoading.value = false;
  }



  /**
   *  메인 월별정산 조회
   */
  void getMonthCost() async {
    try {
      monthCostList.clear();

      Map<String, dynamic> data = await Get.find<DriverWorkService>().getMonthCost();
      monthCostList.addAll(data['monthCostList']);
      monthTotalCost.value = int.parse(data['monthTotalCost']);
      costCnt.value = data['monthCompletedCnt'];
      Get.log('<========== 메인 월별정산 조회: ' + data.toString());

    } catch (e) {
      Util.print(e);
    }
  }

  /**
   *  메인 공지사항 갯수 조회
   */
  void getNoticeCnt() async {
    try {
      Map<String, dynamic> data = await Get.find<DriverWorkService>().getNoticeList();
      noticeCnt.value = data['noticeCnt'];
    } catch (e) {
      Util.print(e);
    }
  }


  /**
   *  메인 배송예약 갯수 조회
   */
  void getDeliveryCnt() async {
    try {
      Map<String, dynamic> data = await Get.find<DriverWorkService>().getDeliveryList();
      delCnt.value = data['totalCnt'];
    } catch (e) {
      Util.print(e);
    }
  }

  /**
   *  메인 알림내역 갯수 조회
   */
  void getAlarmCnt() async {
    try {
      Map<String, dynamic> data = await Get.find<DriverWorkService>().getAlarmList();
      alarmCnt.value = data['alarmCnt'];
    } catch (e) {
      Util.print(e);
    }
  }

  /**
   *  메인 알림내역 조회
   */
  void getAlarmList() async {
    try {
      alarmList.clear();

      Map<String, dynamic> data = await Get.find<DriverWorkService>().getAlarmList();
      alarmList.addAll(data['alarmList']);
      alarmCnt.value = data['alarmCnt'];

    } catch (e) {
        Util.print(e);
    }
  }


  /**
   * 내 차량 정보 조회
   */
  void getVehicleInfo() async {
    vehicle.value = await Get.find<DriverWorkService>().getVehicleInfo();
  }

  /**
   * 내 업체 정보 조회
   */
  void getEnterpriseInfo() async {
    enterprise.value = await Get.find<DriverWorkService>().getEnterpriseInfo();
  }




  TransformationController transController = TransformationController();
  TapDownDetails doubleTapDetails;

  Widget getConveyancePhoto(String photoUrl){
    return FullScreenWidget(
        child: Center(
          child: InteractiveViewer(
            child: photoUrl != null && photoUrl != '' ? Ui.mocarImage('${photoUrl}') : new Icon(Icons.error, color: Colors.white),
            boundaryMargin: EdgeInsets.all(0),
            transformationController: transController,
            maxScale: 5,
          ),
        )
    );
  }

  void handleDoubleTapDown(TapDownDetails details) {

    doubleTapDetails = details;
  }

  void handleDoubleTap() {

    if (transController.value != Matrix4.identity()) {
      transController.value = Matrix4.identity();
    } else {
      final position = doubleTapDetails.localPosition;
      // For a 3x zoom
      transController.value = Matrix4.identity()
        ..translate(-position.dx * 2, -position.dy * 2)
        ..scale(3.0);
    }
  }
}