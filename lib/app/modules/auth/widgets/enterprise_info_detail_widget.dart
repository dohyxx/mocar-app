import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/modules/auth/controllers/auth_controller.dart';

/**
 * 내 정보  - 2.기업 정보
 */
class EnterpriseInfoDetailWidget extends GetWidget<AuthController> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  EnterpriseInfoDetailWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
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
                    '기업 정보',
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

              //사업자명 시작
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text(
                        '사업자명',
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
                            Get.find<AuthController>().comp.value.compNm ?? '',
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
              // 사업자명 종료


              //대표자명 시작
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text(
                        '대표자명',
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
                            Get.find<AuthController>().comp.value.ownerNm ?? '',
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
              // 대표자명 종료


              //사업자 또는 기관번호 시작
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text(
                        '사업자 또는 기관번호',
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
                            Get.find<AuthController>().comp.value.bizNo ?? '',
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
              // 사업자 또는 기관번호 종료


              //업태 시작
              // Padding(
              //   padding: const EdgeInsets.only(top: 12, bottom: 10),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.max,
              //     children: [
              //       Flexible(
              //         flex: 2,
              //         fit: FlexFit.tight,
              //         child: Text(
              //           '업태',
              //           style: TextStyle(
              //             fontFamily: 'Noto Sans',
              //             fontSize: 14,
              //             fontWeight: FontWeight.bold,
              //             color: Color(0xdd191d21),
              //           ),
              //         ),
              //       ),
              //
              //       Flexible(
              //         flex: 3,
              //         fit: FlexFit.tight,
              //         child: Text(
              //           '',
              //           style: TextStyle(
              //             fontFamily: 'Noto Sans',
              //             fontSize: 14,
              //             fontWeight: FontWeight.w400,
              //             color: Color(0xdd191d21),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              //
              // Divider(
              //   color: Color(0xffE1E6EB),
              //   thickness: 1,
              // ),
              // 업태 종료


              //종목 시작
              // Padding(
              //   padding: const EdgeInsets.only(top: 12, bottom: 10),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.max,
              //     children: [
              //       Flexible(
              //         flex: 2,
              //         fit: FlexFit.tight,
              //         child: Text(
              //           '종목',
              //           style: TextStyle(
              //             fontFamily: 'Noto Sans',
              //             fontSize: 14,
              //             fontWeight: FontWeight.bold,
              //             color: Color(0xdd191d21),
              //           ),
              //         ),
              //       ),
              //
              //       Flexible(
              //         flex: 3,
              //         fit: FlexFit.tight,
              //         child: Text(
              //           '',
              //           style: TextStyle(
              //             fontFamily: 'Noto Sans',
              //             fontSize: 14,
              //             fontWeight: FontWeight.w400,
              //             color: Color(0xdd191d21),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Divider(
              //   color: Color(0xffE1E6EB),
              //   thickness: 1,
              // ),
              // 종목 종료


              //사업장 소재지 시작
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text(
                        '사업장 소재지',
                        style: TextStyle(
                          fontFamily: 'Noto Sans',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xdd191d21),
                        ),
                      ),
                    ),

                    Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: Column(
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: (Get.find<AuthController>().comp.value.zipCd ?? '') + ' ' + (Get.find<AuthController>().comp.value.addr ?? ''),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14,
                                    fontFamily: 'NotoSansKR',
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ' + Get.find<AuthController>().comp.value.addrDetl ?? '',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14,
                                    fontFamily: 'NotoSansKR',
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Divider(
              //   color: Color(0xffE1E6EB),
              //   thickness: 1,
              // ),
              //사업장 소재지 종료

              //회사 이메일 주소 시작
              // Padding(
              //   padding: const EdgeInsets.only(top: 12, bottom: 10),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.max,
              //     children: [
              //       Flexible(
              //         flex: 2,
              //         fit: FlexFit.tight,
              //         child: Text(
              //           '회사 이메일 주소',
              //           style: TextStyle(
              //             fontFamily: 'Noto Sans',
              //             fontSize: 14,
              //             fontWeight: FontWeight.bold,
              //             color: Color(0xdd191d21),
              //           ),
              //         ),
              //       ),
              //
              //       Flexible(
              //         flex: 3,
              //         fit: FlexFit.tight,
              //         child: Text(
              //           '',
              //           style: TextStyle(
              //             fontFamily: 'Noto Sans',
              //             fontSize: 14,
              //             fontWeight: FontWeight.w400,
              //             color: Color(0xdd191d21),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // 회사 이메일 주소 종료

            ],
          ),
        ),
      ),
    );
  }
}
