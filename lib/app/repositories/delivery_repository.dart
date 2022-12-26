import 'package:get/get.dart';
import 'package:mocar_test/app/common/util.dart';
import 'package:mocar_test/app/models/delivery/delivery.dart';
import 'package:mocar_test/app/repositories/base_repository.dart';
import 'package:mocar_test/app/services/auth_service.dart';


class DeliveryRepository extends BaseRepository {

  final preUrl = "";

  /**
   * 배송예약 목록 조회
   */
  Future<Map<String, dynamic>> getDeliveryList() async{
    try{
      var _queryParameters = {
        'vehicle_id' : Get.find<AuthService>().user.value.vehicleSn.toString(),
      };

      //라우트 경로 지정
      Uri _uri = getApiBaseUri("dispatch-order-list").replace(queryParameters: _queryParameters);
      Get.log('<==== _uri : ' +_uri.toString());

      var response = await httpClient.getUri(_uri, options: optionsCache);
      Util.print('배송예약 목록 조회: ${response}');


      if (response.data['resultCode'] == 200) {
        //List<dynamic> deliveryDetail = [];
        final data = Map<String, dynamic>();

        // for(var i=0; i<response.data['total']; i++){
        //   deliveryDetail.add(response.data['data'][i]['vehicleRoutes']);
        // }

        data['deliveryList'] = await response.data['data'].map<Delivery>((obj) => Delivery.fromJson(obj)).toList();
        data['totalCnt'] = await response.data['total'];
       // data['deliveryDetail'] = deliveryDetail;

        //Get.log('<==== data[deliveryDetail]: ' +data['deliveryDetail'].toString());

        return data;
      }else{
        throw new Exception(response.data['message']);
      }
    }catch (e) {
      throw new Exception(e);
    }
  }
}
