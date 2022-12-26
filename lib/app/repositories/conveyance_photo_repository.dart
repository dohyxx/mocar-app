import 'dart:io';

import 'package:get/get.dart';
import 'package:mocar_test/app/models/delivery/delivery_detail.dart';
import 'package:mocar_test/app/repositories/base_repository.dart';
import 'package:dio/dio.dart' as dio;



class ConveyancePhotoRepository extends BaseRepository {


  /**
   * 완료사진 등록
   */
  Future<bool> registerPhoto(File photo, int photoNum, int vehicleRouteId) async{
    try{

      dio.FormData formData = dio.FormData.fromMap({
        "file": photo.path != '' ? await dio.MultipartFile.fromFile(photo.path) : null,
        "number" : photoNum,
        "id": vehicleRouteId,
      });

      Uri _uri = getApiBaseUri("dispatch-complete");
      Get.log('<==== _uri : ' +_uri.toString());

      var response = await httpClient.postUri(_uri, data: formData, options: optionsCache);

      if (response.data['resultCode'] == 200) {
        return true;

      }else{
        throw new Exception(response.data['message']);
      }
    }catch (e) {
      throw new Exception(e);
    }
  }

  /**
   * 배송완료 처리
   */
  Future<bool> completeDelivery(int deliveryId) async{
    try{

      Uri _uri = getApiBaseUri("dispatch-order-complete/${deliveryId}");
      Get.log('<==== _uri : ' +_uri.toString());

      var response = await httpClient.putUri(_uri , options: optionsCache);

      if (response.data['resultCode'] == 200) {
        return true;
      }else{
        throw new Exception(response.data['message']);
      }
    }catch (e) {
      throw new Exception(e);
    }
  }



  /**
   * 배송주문 리스트 조회
   */
  Future<List<DeliveryDetail>> getDispatchRouteList(int vehicleRouteId) async{
    try{

      var _queryParameters = {
        'id' : vehicleRouteId.toString(),
      };

      //라우트 경로 지정
      Uri _uri = getApiBaseUri("dispatch-route-list").replace(queryParameters: _queryParameters);
      Get.log('<==== _uri : ' +_uri.toString());

      var response = await httpClient.getUri(_uri, options: optionsCache);

      if (response.data['resultCode'] == 200) {
        return await response.data['data'].map<DeliveryDetail>((obj) => DeliveryDetail.fromJson(obj)).toList();
      }else{
        throw new Exception(response.data['message']);
      }
    }catch (e) {
      throw new Exception(e);
    }
  }
}
