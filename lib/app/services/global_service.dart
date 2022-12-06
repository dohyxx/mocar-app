import 'dart:io';

import 'package:get/get.dart';
import 'package:mocar_test/app/common/helper.dart';
import '../models/global_model.dart';

class GlobalService extends GetxService {
  final global = Global().obs;

  Future<GlobalService> init() async {
    // var response = await Helper.getJsonFile('config/global.json');
    // var response = await Helper.getJsonFile('config/global_test.json');
    var response = await Helper.getJsonFile('config/global_dev.json');
    // var response = await Helper.getJsonFile('config/global_local.json');

    Get.log('<======GlobalService response: '+response.toString());
    global.value = Global.fromJson(response);

    if (global.value.laravelBaseUrl.indexOf('127.0.0.1') > 0){
      if(Platform.isAndroid){
        global.value.laravelBaseUrl = "http://10.0.2.2:8080/";
      }
    }

    if (global.value.laravelBaseUrl.indexOf('10.0.2.2') > 0){
      if(Platform.isIOS){
        global.value.laravelBaseUrl = "http://127.0.0.1:8080/";
      }
    }

    return this;
  }

  String get baseUrl => global.value.laravelBaseUrl;
}
