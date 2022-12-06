import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/common/util.dart';
import 'package:mocar_test/app/modules/root/controllers/root_controller.dart';
import 'package:mocar_test/app/modules/root/widget/main_bottom_card_widget.dart';
import 'package:mocar_test/app/routes/app_routes.dart';
import 'package:mocar_test/app/services/driver_work_service.dart';
import 'package:mocar_test/app/services/settings_service.dart';

class MainBottomWidget extends GetView<RootController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height - 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
              color: Get.theme.focusColor.withOpacity(0.4),
              blurRadius: 30,
              offset: Offset(0, -30)),
        ],
      ),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0x00F5F5F5),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Align(
              alignment: AlignmentDirectional(0, 0),
              child: Stack(alignment: AlignmentDirectional(0, 0), children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xff333D4B),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  topLeft: Radius.circular(12)),
                              boxShadow: [
                                // BoxShadow(
                                // color: Get.theme.focusColor.withOpacity(0.2),
                                // blurRadius: 10,
                                // offset: Offset(0, -20)),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16, right: 10),
                              child: Column(
                                children: [
                                  SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '${Get.find<SettingsService>().today.month}월',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontFamily: 'NotoSansKR',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ' 정산 명세서',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontFamily: 'NotoSansKR',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'NotoSansKR',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            MaterialButton(
                                              padding: EdgeInsets.all(0),
                                              minWidth: 0,
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.white,
                                                size: 35,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Obx(() =>
                                          Text(
                                            '${Util.numberWithComma(controller.monthTotalCost.value, isDecimal: false)}원',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        SizedBox(width: 5),

                                      ],
                                    ),
                                  ),


                                  SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),

                        SizedBox(height: 20),

                        //메인 정산 명세서 리스트 위젯 시작
                        MainBottomCardWidget(),
                        //메인 정산 명세서 리스트 위젯 종료

                        SizedBox(height: 20),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: (){
                                    Get.toNamed(Routes.COSTLIST);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF00AC76),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(vertical: 10),
                                        child: Text(
                                          '월별 정산 전체 보기',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontFamily: 'NotoSansKR',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
