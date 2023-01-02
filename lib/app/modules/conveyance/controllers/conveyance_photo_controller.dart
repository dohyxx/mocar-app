import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocar_test/app/common/util.dart';
import 'package:mocar_test/app/models/delivery/delivery.dart';
import 'package:mocar_test/app/modules/delivery/controllers/delivery_controller.dart';
import 'package:mocar_test/app/repositories/conveyance_photo_repository.dart';
import 'package:mocar_test/app/routes/app_routes.dart';

class ConveyancePhotoController extends GetxController with GetSingleTickerProviderStateMixin {

  // GlobalKey<FormState> loginFormKey;
  final isContentLoading = true.obs;
  ScrollController scrollController;
  ConveyancePhotoRepository conveyancePhotoRepository;

  final picker = ImagePicker();


  //완료사진


  var vehicleRouteId;

  var completedPhotoUrl = <String>[].obs;
  Delivery deliveryDay;

  ConveyancePhotoController(){
    scrollController = new ScrollController();
    conveyancePhotoRepository = new ConveyancePhotoRepository();
  }


  @override
  void onInit() {
    //loginFormKey = new GlobalKey<FormState>();
    super.onInit();
    onRefresh();
  }


  void onRefresh() async {
    isContentLoading.value = true;

    // getDispatchRouteList();
    deliveryDay = Get.find<DeliveryController>().deliveryDay.delSn != null ? Get.find<DeliveryController>().deliveryDay : null;

    if(deliveryDay != null){
      deliveryDay.deliveryDetail.forEach((element) {
        element.photo.clear();
      });
      Util.print('오늘 배송예약: ${deliveryDay.deliveryDetail.toString()}');
    }

    Future.delayed(Duration(milliseconds: 700)) .then((onValue)
    => isContentLoading.value = false);
  }


  Future<File> getImage(ImageSource imageSource) async {
    final pickedFile = await picker.pickImage(source: imageSource, maxHeight: 800, maxWidth: 1000, imageQuality: 75);

    if(pickedFile != null){
      return await File(pickedFile.path);
    }
  }



  /**
   *  완료사진 등록
   */
  void registerPhoto() async {
    try {
      var result;
      var isRegisterPhotoYn;

      //배송 완료 여부 확인
      if(Get.find<DeliveryController>().deliveryDay.shipCompleteYn == 'Y'){
        Util.alert('이미 운송 완료 처리 되었습니다.');
        return;

      }else if(Get.find<DeliveryController>().deliveryDay.delSn == null){
        Util.alert('오늘 배송이 없습니다.');
        return;
      }else{
        // 상하차지 1개 이상 사진 등록 여부 확인

        for(var i=0; i<deliveryDay.deliveryDetail.length; i++){
          if(deliveryDay.deliveryDetail[i].photo.length < 1){
            isRegisterPhotoYn = true;
          }
        }

        // 상하차지 모두 1개 이상 사진이 등록된 경우 운송 처리 진행
        if(isRegisterPhotoYn != null && isRegisterPhotoYn == true){
          Util.alert('모든 상/하차지에 사진이 1장씩은 등록되어야 합니다.');

        }else{
          for(var i=0; i<deliveryDay.deliveryDetail.length; i++){
            for(var j=0; j<deliveryDay.deliveryDetail[i].photo.length; j++){
              if(deliveryDay.deliveryDetail[i].photo[j] != null){
                Util.print('[사진 업로드]- [ID]:${deliveryDay.deliveryDetail[i].routeId}, [순번]:${j+1}, [사진 파일]: ${deliveryDay.deliveryDetail[i].photo[j].toString()}');

                //상하차지 구분 및 사진 순서 별 사진 업로드
                await conveyancePhotoRepository.registerPhoto(deliveryDay.deliveryDetail[i].photo[j], j+1, deliveryDay.deliveryDetail[i].routeId);
              }
            }
          }
          //운송 완료 처리
          result = await completeDelivery(Get.find<DeliveryController>().deliveryDay.delSn);
        }
      }


      if(result != null && result == true){
        Util.alert('운송 완료 처리 되었습니다.', callback: (){
          Get.offAllNamed(Routes.MAINVIEW);
        });
      }else{
        Util.print('완료사진 등록 중 오류가 발생하였습니다.');
      }
    } catch (e) {
      Util.print(e);
    }
}



  /**
   *  배송완료 처리
   */
  Future<bool> completeDelivery(int deliveryId) async {
    try{
      return (await conveyancePhotoRepository.completeDelivery(deliveryId));

    }catch(e){
      Util.print(e);
    }
  }
}