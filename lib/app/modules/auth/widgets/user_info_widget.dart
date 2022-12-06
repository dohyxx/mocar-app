import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/modules/auth/controllers/auth_controller.dart';
import 'package:mocar_test/app/modules/auth/controllers/user_controller.dart';
import 'package:mocar_test/app/modules/auth/widgets/enterprise_info_detail_widget.dart';
import 'package:mocar_test/app/modules/auth/widgets/user_info_detail_widget.dart';

import '../../../routes/app_routes.dart';

class UserInfoWidget extends GetView<UserController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height - 120,
      decoration: BoxDecoration(
        color: Color(0xffF0F4FA),
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
                            color: Color(0xffF0F4FA),
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
                            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 30),
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
                                              text: '내 정보 보기',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: 'NotoSansKR',
                                                fontWeight: FontWeight.w700,
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
                                              color: Color(0xff333D4B),
                                              size: 35,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      fit: FlexFit.tight,
                                      flex: 5,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Image.asset(
                                              'assets/icon/icon_4.png',
                                              // height: 56,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 7,
                                          ),
                                          Expanded(
                                            flex: 9,
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Obx(() =>
                                                    Text(
                                                      Get.find<AuthController>().user.value.driverNm ?? '',
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: Colors.black87,
                                                        fontFamily: 'NotoSansKR',
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w700,
                                                        fontStyle: FontStyle.normal,
                                                      ),
                                                    )),
                                                Obx(() =>
                                                    Text.rich(
                                                      TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: Get.find<AuthController>().user.value.email ?? '',
                                                            style: TextStyle(
                                                              color: Colors.black87,
                                                              fontSize: 13,
                                                              fontFamily: 'NotoSansKR',
                                                              fontWeight: FontWeight.w400,
                                                              fontStyle: FontStyle.normal,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                    Flexible(
                                      fit: FlexFit.tight,
                                      flex: 3,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          MaterialButton(
                                            height: 24,
                                            minWidth: 10,
                                            color: Color(0xffF5F7FA),
                                            elevation: 0,
                                            onPressed: () async {
                                              Get.log('<====== 로그아웃 버튼 클릭...');
                                              Future.delayed(const Duration(milliseconds: 1500), () async {
                                                await Get.find<AuthController>().logout();
                                                await Get.offAllNamed(Routes.LOGINVIEW);
                                              });
                                            },
                                            shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                  color: Color(0xffE1E6EB),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(5)),
                                            child: Text(
                                              '로그아웃',
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 11,
                                                fontFamily: 'NotoSansKR',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                                SizedBox(height: 30),

                                //1.회원(차주) 정보 위젯 시작
                                UserInfoDetailWidget(),

                                //2.기업 정보 위젯 시작
                                EnterpriseInfoDetailWidget(),

                              ],
                            ),
                          ),
                        ),
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
