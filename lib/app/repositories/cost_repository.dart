import 'package:get/get.dart';
import 'package:mocar_test/app/common/ui.dart';
import 'package:mocar_test/app/common/util.dart';
import 'package:mocar_test/app/models/cost/cost.dart';
import 'package:mocar_test/app/repositories/base_repository.dart';
import 'package:mocar_test/app/services/auth_service.dart';


class CostRepository extends BaseRepository{

  final preUrl = "";


   /**
    * 월별정산 조회
    */
    Future<Map<String, dynamic>> getMonthCost(String selectedMonth) async{
     try{
       var _queryParameters = {
         'month' : selectedMonth.toString(),
         'vehicle_id' : Get.find<AuthService>().user.value.vehicleSn.toString(),
       };

      Uri _uri = getApiBaseUri("dispatch-paid").replace(queryParameters: _queryParameters);
      Get.log('<==== _uri : ' +_uri.toString());

      var response = await httpClient.getUri(_uri, options: optionsCache);
      //Util.print('월별정산 목록 조회: ${response}');


      if (response.data['resultCode'] == 200) {

        final data = Map<String, dynamic>();
        data['monthCostList'] = await response.data['data'].map<Cost>((obj) => Cost.fromJson(obj)).toList();
        data['monthCompletedCnt'] = await response.data['total'];
        data['monthTotalCost'] = await response.data['totalCost'];
        return data;
      }else{
        return response.data['resultCode'];
      }
    }catch (e) {
       Util.print(e);
    }
  }
}
