import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/models/enum.dart';
import 'package:mocar_test/app/modules/auth/controllers/auth_controller.dart';

/**
 * 내 정보  - 1.회원(차주) 정보
 */
class UserInfoDetailWidget extends GetWidget<AuthController> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  UserInfoDetailWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  '회원(차주) 정보',
                  style: TextStyle(
                    fontFamily: 'Noto Sans',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xdd191d21),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),

            //아이디(이메일) 시작
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Text(
                      '아이디',
                      style: TextStyle(
                        fontFamily: 'Noto Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xdd191d21),
                      ),
                    ),
                  ),

                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Obx(() =>
                        Text(
                          Get.find<AuthController>().user.value.email ?? '',
                          style: TextStyle(
                            fontFamily: 'Noto Sans',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xdd191d21),
                          ),
                        )),
                  ),
                ],
              ),
            ),

            Divider(
              color: Color(0xffE1E6EB),
              thickness: 1,
            ),
            // 아이디(이메일) 종료


            //비밀번호 시작
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Text(
                      '비밀번호',
                      style: TextStyle(
                        fontFamily: 'Noto Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xdd191d21),
                      ),
                    ),
                  ),

                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Text(
                      '******',
                      style: TextStyle(
                        fontFamily: 'Noto Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xdd191d21),
                      ),

                    ),
                  ),
                ],
              ),
            ),

            Divider(
              color: Color(0xffE1E6EB),
              thickness: 1,
            ),
            // 비밀번호 종료


            //이름 시작
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Text(
                      '이름',
                      style: TextStyle(
                        fontFamily: 'Noto Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xdd191d21),
                      ),
                    ),
                  ),

                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Obx(() =>
                        Text(
                          Get.find<AuthController>().user.value.driverNm ?? '',
                          style: TextStyle(
                            fontFamily: 'Noto Sans',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xdd191d21),
                          ),
                        )),
                  ),
                ],
              ),
            ),

            Divider(
              color: Color(0xffE1E6EB),
              thickness: 1,
            ),
            // 이름 종료


            //휴대폰 번호 시작
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Text(
                      '휴대폰 번호',
                      style: TextStyle(
                        fontFamily: 'Noto Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xdd191d21),
                      ),
                    ),
                  ),

                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Obx(() =>
                        Text(
                          Get.find<AuthController>().user.value.phoneNumber ?? '',
                          style: TextStyle(
                            fontFamily: 'Noto Sans',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xdd191d21),
                          ),
                        )),
                  ),
                ],
              ),
            ),

            Divider(
              color: Color(0xffE1E6EB),
              thickness: 1,
            ),
            // 휴대폰 번호 종료


            //이메일 주소 시작
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Text(
                      '이메일 주소',
                      style: TextStyle(
                        fontFamily: 'Noto Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xdd191d21),
                      ),
                    ),
                  ),

                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Obx(() =>
                        Text(
                          Get.find<AuthController>().user.value.email ?? '',
                          style: TextStyle(
                            fontFamily: 'Noto Sans',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xdd191d21),
                          ),
                        )),
                  ),
                ],
              ),
            ),
            Divider(
              color: Color(0xffE1E6EB),
              thickness: 1,
            ),
            // 이메일 주소 종료


            //소유 차량 시작
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Text(
                      '소유 차량',
                      style: TextStyle(
                        fontFamily: 'Noto Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xdd191d21),
                      ),
                    ),
                  ),

                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Row(
                      children: [
                        Obx(() =>
                            Text(
                              Get.find<AuthController>().vehicle.value.vehicleNo ?? '',
                              style: TextStyle(
                                fontFamily: 'Noto Sans',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xdd191d21),
                              ),
                            )),
                        Text(
                          ' | ',
                          style: TextStyle(
                            fontFamily: 'Noto Sans',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffE1E6EB),
                          ),
                        ),
                        Text(
                          '${VehicleType.values.byName('TYPE_${Get.find<AuthController>().vehicle.value.vehicleTypeCd}').codeName}',
                          style: TextStyle(
                            fontFamily: 'Noto Sans',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xdd191d21),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //소유 차량 종료
          ],
        ),
      ),
    );

  }
}
