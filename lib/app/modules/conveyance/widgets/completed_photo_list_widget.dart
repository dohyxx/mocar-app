import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocar_test/app/common/util.dart';
import 'package:mocar_test/app/models/enum.dart';
import 'package:mocar_test/app/modules/conveyance/controllers/conveyance_photo_controller.dart';
import 'package:mocar_test/app/modules/root/controllers/root_controller.dart';


/**
 * 사진 업로드 위젯
 */
class CompletedPhotoListWidget extends GetWidget<ConveyancePhotoController> {

  int index;

  CompletedPhotoListWidget({Key key, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),

        Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xffF5F7FA),
                    border: Border.all(width: 1, color: Color(0xffd6d6d6)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icon/point.png',
                      ),
                      SizedBox(width: 5),
                      Text(
                         '${controller.deliveryDay.deliveryDetail[index].nodeTypeCd.codeName}',
                        style: TextStyle(
                          fontFamily: 'Noto Sans',
                          fontSize: 12,
                          color: Color(0xFF00AC76),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 16),
                      Row(
                        children: [
                          Text(
                            '${controller.deliveryDay.deliveryDetail[index].nodeName}',
                            style: TextStyle(
                              fontFamily: 'Noto Sans',
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        //예약번호 입력 종료

        SizedBox(height: 16),

        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(width: 16),
            Text(
              '${controller.deliveryDay.deliveryDetail[index].nodeTypeCd.codeName.contains('상차') ? '상차(픽업) ' : '하차지 '}',
              style: TextStyle(
                color: Color(0xdd00AC76),
                fontFamily: 'NotoSansKR',
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              ' 사진 3장까지 업로드 가능합니다.',
              style: TextStyle(
                color: Color(0xff838C97),
                fontFamily: 'NotoSansKR',
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),

        SizedBox(height: 18),


        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              settingPhoto(1),
              settingPhoto(2),
              settingPhoto(3),
            ],
          ),
        ),

        SizedBox(height: 8),
      ],
    );
  }




  //사진 등록
  Widget settingPhoto(int disNo){

    var photoUrl = ''.obs;

    if(controller.deliveryDay.deliveryDetail[index].attachImageUrl1 != null && disNo == 1){
      photoUrl.value = controller.deliveryDay.deliveryDetail[index].attachImageUrl1;

    }else if(controller.deliveryDay.deliveryDetail[index].attachImageUrl2 != null && disNo == 2){
      photoUrl.value = controller.deliveryDay.deliveryDetail[index].attachImageUrl2;

    }else if(controller.deliveryDay.deliveryDetail[index].attachImageUrl3 != null && disNo == 3){
      photoUrl.value = controller.deliveryDay.deliveryDetail[index].attachImageUrl3;
    }
    Util.print('photoUrl: ${photoUrl.value}');

    // 이미지가 등록되었을 경우
    if(photoUrl.value != '') {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            height: 100,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                width: 1,
                color: Color(0xffCCD6E6),
              ),
            ),
            child: Obx((){
              return Get.find<RootController>().getConveyancePhoto(photoUrl.value);
            }),
          ),
        ),
      );
    }

    final photo1 = File('').obs;
    final photo2 = File('').obs;
    final photo3 = File('').obs;

    // 그외 경우
    var tempFile = File('').obs;
    if(disNo == 1){
      tempFile = photo1;
    }else if(disNo == 2){
      tempFile = photo2;
    }else{
      tempFile = photo3;
    }

    return Expanded(
      child: InkWell(
        onTap: () async {

          File file = await controller.getImage(ImageSource.camera);

          if (disNo == 1) {
            photo1.value = file != null ? file : photo1.value;
            controller.deliveryDay.deliveryDetail[index].photo.add(file);
            Util.print('photo1.value: ${photo1.value.path}, [순번] ${disNo}');
          }
          else if(disNo == 2){
            photo2.value = file != null ? file : photo2.value;
            controller.deliveryDay.deliveryDetail[index].photo.add(file);
            Util.print('photo2.value: ${photo2.value.path}, [순번] ${disNo}');

          }else{
            photo3.value = file != null ? file : photo3.value;
            controller.deliveryDay.deliveryDetail[index].photo.add(file);
            Util.print('photo3.value: ${photo3.value.path}, [순번] ${disNo}');
          }


        },
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            height: 100,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                width: 1,
                color: Color(0xffCCD6E6),
              ),
            ),
            child: Obx((){
              return tempFile.value.path != '' && tempFile.value.path != null
              ?  Image.file(tempFile.value)
              :  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icon/photo_2.png'),

                  SizedBox(height: 5),

                  Text(
                    '사진첨부',
                    style: TextStyle(
                      color: Color(0xffCCD6E6),
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
