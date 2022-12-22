import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mocar_test/app/repositories/setting_repository.dart';


class SettingsService extends GetxService {


  GetStorage _box;
  SettingRepository _settingsRepo;

  DateTime today;
  final routeMap = 'https://dev.mocar.io/tms/dispatch/routePopup/mobile?dispatch_order_id=';

  SettingsService() {
    _settingsRepo = new SettingRepository();
    _box = new GetStorage();
    today = DateTime.now();

    //Get.log('<======= 현재 날짜: ${today.toString()}');
  }

  Future<SettingsService> init() async {
    return this;
  }

}
