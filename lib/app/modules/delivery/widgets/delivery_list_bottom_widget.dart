import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/models/delivery/delivery_detail.dart';
import 'package:mocar_test/app/modules/delivery/controllers/delivery_controller.dart';
import 'package:mocar_test/app/models/enum.dart';
import 'package:mocar_test/app/routes/app_routes.dart';




class DeliveryListBottomWidget extends GetWidget<DeliveryController> {
  int index;
  var statusText = ''.obs;   //배송 상태
  var photoCnt = 0.obs;     //사진 등록 개수
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  DeliveryListBottomWidget({Key key, this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(controller.deliveryDay.shipCompleteYn == 'Y'){
      statusText = '상/하차 완료'.obs;

        if(controller.deliveryDay.deliveryDetail[index].attachImageUrl1 != '') photoCnt.value++;
        if(controller.deliveryDay.deliveryDetail[index].attachImageUrl2 != '') photoCnt.value++;
        if(controller.deliveryDay.deliveryDetail[index].attachImageUrl3 != '') photoCnt.value++;

    }else{
      statusText = '사진 요망'.obs;
    }

    return Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0),
                ),
                // width: MediaQuery.of(context).size.width,
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/icon/point.png',
                                            ),
                                            SizedBox(width: 2),

                                            Text(
                                              '${controller.deliveryDay.deliveryDetail[index].nodeTypeCd.codeName}',
                                              style: TextStyle(
                                                fontFamily: 'Noto Sans',
                                                fontSize: 12,
                                                color: Color(0xFF00AC76),
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
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
                                        SizedBox(width: 30),

                                      ],
                                    ),
                                    SizedBox(height: 12),

                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Color(0xffE1E6EB),
                                            ),
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 3),
                                              child: Text(
                                                '도로명',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11,
                                                  fontFamily: 'NotoSansKR',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 12),

                                        Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                                            child: Text(
                                              '${controller.deliveryDay.deliveryDetail[index].roadAddress}',
                                              style: TextStyle(
                                                color: Color(0xff333D4B),
                                                fontSize: 14,
                                                fontFamily: 'NotoSansKR',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 3),

                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Color(0xffE1E6EB),
                                            ),
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 19, vertical: 3),
                                              child: Text(
                                                '지번',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11,
                                                  fontFamily: 'NotoSansKR',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        SizedBox(width: 12),

                                        Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                                            child: Text(
                                              '${controller.deliveryDay.deliveryDetail[index].address}',
                                              style: TextStyle(
                                                color: Color(0xff333D4B),
                                                fontSize: 14,
                                                fontFamily: 'NotoSansKR',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/icon/clock.png',
                                            ),
                                            SizedBox(width: 5),

                                            Text(
                                              '${controller.deliveryDay.deliveryDetail[index].nodeTypeCd.codeName.substring(0,2)} - ',
                                              style: TextStyle(
                                                fontFamily: 'Noto Sans',
                                                fontSize: 13,
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),

                                        //TODO: Image && Text 분기 처리 필요 (상/하차완료 - 사진 요망 - 픽업사진)
                                        Obx((){
                                          if(statusText.value != '사진 요망'){
                                            return InkWell(
                                              onTap: (){
                                                Get.toNamed(Routes.COMPLETEDPHOTO);
                                              },
                                              child: Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFF5F7FA),
                                                      borderRadius: BorderRadius.circular(8),
                                                      border: Border.all(
                                                        color: Color(0xffE1E6EB),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            'assets/icon/photo.png',
                                                          ),
                                                          SizedBox(width: 5),

                                                          Text(
                                                            '${photoCnt}',
                                                            style: TextStyle(
                                                              color: Color(0xff00AC76),
                                                              fontSize: 12,
                                                              fontFamily: 'NotoSansKR',
                                                              fontWeight: FontWeight.w500,
                                                            ),
                                                          ),
                                                          SizedBox(width: 5),

                                                          Text(
                                                            '|',
                                                            style: TextStyle(
                                                              color: Color(0xffE1E6EB),
                                                              fontSize: 12,
                                                              fontFamily: 'NotoSansKR',
                                                              fontWeight: FontWeight.w500,
                                                            ),
                                                          ),
                                                          SizedBox(width: 5),

                                                          Text(
                                                            '${statusText}',
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 10.5,
                                                              fontFamily: 'NotoSansKR',
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }else{
                                            return InkWell(
                                              onTap: (){
                                                Get.toNamed(Routes.COMPLETEDPHOTO);
                                              },
                                              child: Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFF5F7FA),
                                                      borderRadius: BorderRadius.circular(8),
                                                      border: Border.all(
                                                        color: Color(0xffE1E6EB),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            'assets/icon/insert-images.png',
                                                          ),
                                                          SizedBox(width: 8),

                                                          Text(
                                                            '${statusText}',
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 10.5,
                                                              fontFamily: 'NotoSansKR',
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }
                                        }),
                                      ],
                                    ),
                                    SizedBox(height: 10),

                                    Divider(
                                      color: Color(0xffE1E6EB),
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
              ),
            ),
          ],
        );
  }
}
