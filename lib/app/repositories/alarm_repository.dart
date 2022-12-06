import 'package:get/get.dart';
import 'package:mocar_test/app/common/ui.dart';
import 'package:mocar_test/app/common/util.dart';
import 'package:mocar_test/app/models/alarm/alarm.dart';
import 'package:mocar_test/app/repositories/base_repository.dart';


class AlarmRepository extends BaseRepository{

  final preUrl = "";


   /**
    * 알람내역 조회
    */
    Future<Map<String, dynamic>> getAlarmList() async{
     try{
      //라우트 경로 지정
      Uri _uri = getApiBaseUri("system-noti");
      Get.log('<==== _uri : ' +_uri.toString());

      //API 호출
      var response = await httpClient.getUri(_uri, options: optionsCache);


      if (response.data['resultCode'] == 200) {
        final data = Map<String, dynamic>();
        data['alarmList'] = await response.data['data'].map<Alarm>((obj) => Alarm.fromJson(obj)).toList();
        data['alarmCnt'] = response.data['total'];
        return data;
      }
      else {
        return response.data['message'];
      }
    }catch (e) {
       Get.showSnackbar(Ui.ErrorSnackBar(message: e.message));
    }
  }


  /**
   * 알람내역 읽음 처리
   */
  Future<bool> readAlarmContent(int readId) async{
    try{
      var _queryParameters = {
        'id' : readId.toString(),
      };

      //라우트 경로 지정
      Uri _uri = getApiBaseUri("system-noti/read").replace(queryParameters: _queryParameters);;
      Util.print('알람 읽음 처리 ${readId}: ' +_uri.toString());

      var response = await httpClient.getUri(_uri, options: optionsCache);


      if (response.data['resultCode'] == 200) {
        return true;
      }
      else {
        return response.data['message'];
      }
    }catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.message));
    }
  }
}
