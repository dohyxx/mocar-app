import 'dart:async';
import 'package:get/get.dart';
import 'package:mocar_test/app/models/delivery/delivery.dart';
import 'package:mocar_test/app/repositories/alarm_repository.dart';
import 'package:mocar_test/app/repositories/board_repository.dart';
import 'package:mocar_test/app/repositories/cost_repository.dart';
import 'package:mocar_test/app/repositories/delivery_repository.dart';
import 'package:mocar_test/app/repositories/user_detail_repository.dart';
import 'package:mocar_test/app/services/settings_service.dart';


class DriverWorkService extends GetxService {

  final deliveryList = <Delivery>[].obs;


  Future<DriverWorkService> init() async {
    return this;
  }


  /**
   * 월별정산 조회
   */
  Future getMonthCost() async {
    CostRepository _costRepository = CostRepository();
    return await _costRepository.getMonthCost(Get.find<SettingsService>().today.month.toString());
  }

  /**
   *  공지사항 조회
   */
  Future getNoticeList() async {
    BoardRepository _boardRepository = BoardRepository();
    return await _boardRepository.getNoticeList();
  }

  /**
   *  배송예약 조회
   */
  Future getDeliveryList() async {
    DeliveryRepository _deliveryRepository = DeliveryRepository();
    Map<String, dynamic> data = await _deliveryRepository.getDeliveryList();
    deliveryList.assignAll(data['deliveryList']);

    return data;
  }

  /**
   *  알림내역 조회
   */
  Future getAlarmList() async {
    AlarmRepository _alarmRepository = AlarmRepository();
    return await _alarmRepository.getAlarmList();
  }

  /**
   * 내 차량 정보 조회
   */
  Future getVehicleInfo() async {
    UserDetailRepository _userDetailRepository = UserDetailRepository();
    return await _userDetailRepository.getVehicleInfo();
  }

  /**
   * 내 업체 정보 조회
   */
  Future getEnterpriseInfo() async {
    UserDetailRepository _userDetailRepository = UserDetailRepository();
    return await _userDetailRepository.getEnterpriseInfo();
  }



}