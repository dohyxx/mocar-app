import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocar_test/app/common/ui.dart';
import 'package:mocar_test/app/common/util.dart';
import 'package:mocar_test/app/models/delivery/delivery_detail.dart';
import 'package:mocar_test/app/models/enum.dart';
import 'package:mocar_test/app/repositories/conveyance_photo_repository.dart';
import 'package:mocar_test/app/routes/app_routes.dart';
import 'package:mocar_test/app/services/driver_work_service.dart';




class ConveyancePhotoController extends GetxController with GetSingleTickerProviderStateMixin {

  // GlobalKey<FormState> loginFormKey;
  final isContentLoading = true.obs;
  ScrollController scrollController;
  ConveyancePhotoRepository conveyancePhotoRepository;

  final picker = ImagePicker();


  //완료사진
  var photoList1 = <File>[].obs; //상차지1
  var photoList2 = <File>[].obs; //상차지2
  var photoList3 = <File>[].obs; //하차지
  var vehicleRouteId;

  var completedPhotoUrl = <String>[].obs;
  var deliveryDetail = <DeliveryDetail>[].obs;


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

    getDispatchRouteList();

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
      if(Get.find<DriverWorkService>().deliveryList.first.shipCompleteYn == 'Y'){
        Util.alert('이미 운송 완료 처리 되었습니다.');

      }else{
        // 상하차지 1개 이상 사진 등록 여부 확인
        for(var i=0; i<deliveryDetail.length; i++){
          if(deliveryDetail[i].photo.isEmpty && deliveryDetail[i].photo.length < 1){
            isRegisterPhotoYn = true;
          }
        }

        // 상하차지 모두 1개 이상 사진이 등록된 경우 운송 처리 진행
        if(isRegisterPhotoYn != null && isRegisterPhotoYn == true){
          Util.alert('모든 상/하차지에 사진이 1장씩은 등록되어야 합니다.');

        }else{
          for(var i=0; i<deliveryDetail.length; i++){
            for(var j=0; j<deliveryDetail[i].photo.length; j++){
              if(deliveryDetail[i].photo[j] != null){
                //상하차지 구분 및 사진 순서 별 사진 업로드
                await conveyancePhotoRepository.registerPhoto(deliveryDetail[i].photo[j], j+1, deliveryDetail[i].routeId);
              }
              Util.print('[사진 업로드]- [ID]:${deliveryDetail[i].routeId}, [순번]:${j+1}, [사진 파일]: ${deliveryDetail[i].photo[j].toString()}');
            }
          }
          //운송 완료 처리
          result = await completeDelivery(Get.find<DriverWorkService>().deliveryList.first.delSn);
        }
      }


      if(result != null && result == true){
        Util.alert('운송 완료 처리 되었습니다.', callback: (){
          Get.offAllNamed(Routes.MAINVIEW);
        });
      }

    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.message));
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






  /**
   *  완료사진 리스트 조회
   */
  void getDispatchRouteList() async {
    var routeId = <int>[].obs;
    deliveryDetail.clear();

    Get.find<DriverWorkService>().deliveryList.forEach((element) {
      routeId.add(element.delSn);
    });


    //사진 업로드 위한 배송주문 리스트 조회
    if(routeId != null && routeId.length > 0){
      vehicleRouteId = routeId[0];
      List<DeliveryDetail> data = await conveyancePhotoRepository.getDispatchRouteList(routeId[0]); //ID 경유지, 하차지 조회
      //Util.print('List<DeliveryDetail> data: ${data.toString()}');

      data.forEach((element) {
        if(element.nodeTypeCd.codeKey == 'P' || element.nodeTypeCd.codeKey == 'E'){
          deliveryDetail.add(element);
        }
      });
      Util.print('완료사진 리스트 조회 getDispatchRouteList().deliveryDetail: ${deliveryDetail}');
    }
  }
}