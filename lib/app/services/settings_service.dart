import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mocar_test/app/repositories/setting_repository.dart';
import 'package:mocar_test/app/services/global_service.dart';


class SettingsService extends GetxService {


  GetStorage _box;
  SettingRepository _settingsRepo;

  DateTime today;
  final routeMap = '${Get.find<GlobalService>().global.value.laravelBaseUrl}tms/dispatch/routePopup/mobile?dispatch_order_id=';

  SettingsService() {
    _settingsRepo = new SettingRepository();
    _box = new GetStorage();
    today = DateTime.now();
  }

  Future<SettingsService> init() async {
    return this;
  }

}
