import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/common/ui.dart';
import 'package:mocar_test/app/models/alarm/alarm.dart';
import 'package:mocar_test/app/repositories/alarm_repository.dart';
import 'package:mocar_test/app/services/driver_work_service.dart';



class AlarmController extends GetxController with GetSingleTickerProviderStateMixin {

  final isContentLoading = true.obs;

  ScrollController scrollController;
  AlarmRepository alarmRepository;

  var alarmList = <Alarm>[].obs;
  var alarmSn = 0.obs;


  AlarmController(){
    scrollController = new ScrollController();
    alarmRepository = new AlarmRepository();
  }


  @override
  void onInit() {
    super.onInit();
    onRefresh();
  }


  /**
   * 새로고침
   */
  void onRefresh() async {
    isContentLoading.value = true;

    getAlarmList();

    Future.delayed(Duration(milliseconds: 600)) .then((onValue)
    => isContentLoading.value = false);
  }


  /**
   *  알림내역 조회
   */
  void getAlarmList() async {
    try {
      alarmList.clear();

      Map<String, dynamic> data = await Get.find<DriverWorkService>().getAlarmList();
      alarmList.addAll(data['alarmList']);

      Get.log('<===== alarmList : ' + alarmList.toString());

    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.message));
    }
  }


  /**
   *  알림내역 읽음 처리
   */
  void readAlarmContent() async {
    try {
      bool result = await alarmRepository.readAlarmContent(alarmSn.value);

    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.message));
    }
  }
}