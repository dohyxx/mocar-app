import 'package:get/get.dart';
import 'package:mocar_test/app/common/util.dart';
import 'package:mocar_test/app/models/enterprise.dart';
import 'package:mocar_test/app/models/vehicle_model.dart';
import 'package:mocar_test/app/repositories/base_repository.dart';
import 'package:mocar_test/app/services/auth_service.dart';


class UserDetailRepository extends BaseRepository {

  final preUrl = "";

  /**
   *  내 차량 조회
   */
  Future<Vehicle> getVehicleInfo() async{
    try{
      Uri _uri = getApiBaseUri("info/vehicles");
      Get.log('<==== _uri : ' +_uri.toString());

      var response = await httpClient.postUri(_uri, data: {'vehicle_id' : Get.find<AuthService>().user.value.vehicleSn}, options: optionsCache);

      if (response.data['resultCode'] == 200) {
        return Vehicle.fromJson(response.data['data']);
      }else{
        throw new Exception(response.data['resultMessage']);
      }
    }catch(e){
      Util.print(e);
    }
  }



  /**
   *  내 업체 조회
   */
  Future<Enterprise> getEnterpriseInfo() async{
    try{
      Uri _uri = getApiBaseUri("info/comp");
      Get.log('<==== _uri : ' +_uri.toString());

      var response = await httpClient.postUri(_uri, options: optionsCache);

      if (response.data['resultCode'] == 200) {
        return Enterprise.fromJson(response.data['data']);
      }else{
        throw new Exception(response.data['resultMessage']);
      }
    }catch(e){
      Util.print(e);
    }
  }


}
