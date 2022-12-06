import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/common/util.dart';
import 'package:mocar_test/app/flutter_flow/flutter_flow_util.dart';
import 'package:mocar_test/app/modules/auth/controllers/auth_controller.dart';
import 'package:mocar_test/app/modules/delivery/controllers/delivery_controller.dart';
import 'package:mocar_test/app/modules/delivery/widgets/delivery_card_widget.dart';
import 'package:mocar_test/app/modules/global_widgets/circular_loading_widget.dart';
import 'package:mocar_test/app/services/settings_service.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WholePathView extends GetView<DeliveryController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  final popupHeight = 100.obs;

  @override
  Widget build(BuildContext context) {
    controller.isSetContentLoading();

    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: RefreshIndicator(
          key: refreshKey,
          // edgeOffset: -200,
          onRefresh: () async {
            refreshKey.currentState.show(atTop: true);
            // 새로고침
            controller.onRefresh();
            return null;
          },
          child:
              Obx((){
                if(controller.isContentLoading.isTrue){
                  return Center(
                      child: new CircularLoadingWidget(height: 90));
                }else{
                  return  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(bottom: (popupHeight.value-25)*0.01),
                    height: MediaQuery.of(context).size.height,
                    child: Obx((){
                      if(controller.isContentLoading.isTrue){
                        return CircularLoadingWidget(height: 90);
                      }else{
                        return WebView(
                            javascriptMode: JavascriptMode.unrestricted,
                            debuggingEnabled: true,
                            onWebViewCreated: (_con) {
                              controller.webView = _con;
                              Map<String, String> headers = {"authorization": 'Bearer ${Get.find<AuthController>().user.value.jwtToken}'};
                              controller.webView.loadUrl(Get.find<SettingsService>().routeMap + '${controller.deliveryList.first.delSn}', headers: headers);

                            },

                            onPageStarted: (url) {
                            },

                            onPageFinished: (String url) async {

                              // _webController.evaluateJavascript("document.getElementsByTagName('main')[0].style.display ='none'",);
                            }
                        );
                      }
                    })
                  );
                }
              }),
        ),
      ),


      //하단 버튼 시작
      bottomNavigationBar:
        // Container(
        //   // height: controller.isExpanded.value == false ? 153 : 410,
        //   height: 115,
        //   decoration: BoxDecoration(
        //     color: Color(0xff333D4B),
        //     borderRadius: BorderRadius.only(
        //         topRight: Radius.circular(18),
        //         topLeft: Radius.circular(18)),
        //     boxShadow: [
        //       BoxShadow(
        //       color: Get.theme.focusColor.withOpacity(0.2),
        //       blurRadius: 10,
        //       offset: Offset(0, -20)),
        //     ],
        //   ),
        //   child:
        //   Column(
        //     children: [
              // InkWell(
              //   onTap: () {
              //     Util.print('controller.isExpanded.value: ' +controller.isExpanded.value.toString());
              //     if(controller.isExpanded.value){
              //       controller.isExpanded.value = false;
              //     }else{
              //       controller.isExpanded.value = true;
              //     }
              //   },
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.only(top: 8),
              //         child: Image.asset('assets/icon/arrow.png'),
              //       )],
              //   ),
              // ),

              // controller.isExpanded.value == true ?
              // Padding(
              //   padding: const EdgeInsets.only(left: 18, top: 8, right: 8),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Expanded(
              //         child: Row(
              //           children: [
              //             Image.asset(
              //               'assets/icon/icon_4.png',
              //               // height: 56,
              //             ),
              //
              //             SizedBox(width: 5),
              //
              //             Text(
              //               '${Get.find<AuthController>().user.value.driverNm} 기사님',
              //               overflow: TextOverflow.ellipsis,
              //               style: TextStyle(
              //                 color: Colors.black87,
              //                 fontFamily: 'NotoSansKR',
              //                 fontSize: 14,
              //                 fontWeight: FontWeight.w700,
              //                 fontStyle: FontStyle.normal,
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //
              //       Row(
              //         children: [
              //           Image.asset(
              //             'assets/icon/small_bell.png',
              //             // height: 56,
              //           ),
              //           SizedBox(
              //             width: 7,
              //           ),
              //           Text(
              //             '25',
              //             overflow: TextOverflow.ellipsis,
              //             style: TextStyle(
              //               color: Colors.black87,
              //               fontFamily: 'NotoSansKR',
              //               fontSize: 14,
              //               fontWeight: FontWeight.w700,
              //               fontStyle: FontStyle.normal,
              //             ),
              //           ),
              //
              //           SizedBox(width: 10),
              //         ],
              //       ),
              //     ],
              //   ),
              // )
              // : SizedBox(),


              // controller.isExpanded.value == true ?
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(22, 0, 6, 0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Expanded(
              //         child: Row(
              //           children: [
              //             Text('이달 총 주행 ',
              //               style: TextStyle(
              //                 fontSize: 13,
              //               ),
              //             ),
              //             Text('29,500 Km ',
              //               style: TextStyle(
              //                 fontSize: 13,
              //                 fontWeight: FontWeight.w700,
              //               ),
              //             ),
              //             Text(' | ',
              //               style: TextStyle(
              //                 fontSize: 13,
              //               ),
              //             ),
              //             Text('상차 ',
              //               style: TextStyle(
              //                 fontSize: 13,
              //               ),
              //             ),
              //             Text('75회',
              //               style: TextStyle(
              //                 fontSize: 13,
              //                 fontWeight: FontWeight.w700,
              //               ),
              //             ),
              //             SizedBox(width: 30),
              //           ],
              //         ),
              //       ),
              //
              //       MaterialButton(
              //         padding: EdgeInsets.all(0),
              //         minWidth: 0,
              //         onPressed: () {
              //           //
              //         },
              //         child: Image.asset('assets/icon/refresh.png',
              //           width: 18,
              //           height: 18,
              //         ),
              //       ),
              //     ],
              //   ),
              // )
              // : SizedBox(),


              // controller.isExpanded.value == true ?
              // Expanded(
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 20),
              //     child: Row(
              //       mainAxisSize: MainAxisSize.max,
              //       children: [
              //         //메인 경로 하단 카드 위젯 시작
              //         MainPathCardWidget(title: '배송예약', photo: 'small_group1.png'),
              //         MainPathCardWidget(title: '정산내역', photo: 'small_icon1.png'),
              //         MainPathCardWidget(title: '인증사진', photo: 'small_icon2.png'),
              //         //메인 경로 하단 카드 위젯 종료
              //       ],
              //     ),
              //   ),
              // )
              // : SizedBox(),
              //
              // SizedBox(height: 8),


              // controller.isExpanded.value == true ?
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: Row(
              //     children: [
              //       Text('전체공지',
              //         style: TextStyle(
              //           fontSize: 12,
              //           color: Color(0xff00AC76),
              //           fontWeight: FontWeight.w700,
              //         ),
              //       ),
              //     ],
              //   ),
              // )
              // : SizedBox(),


              // controller.isExpanded.value == true ?
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: Text(' - 8월 26일(토) 2:00~18:00 시스템 점검으로 서비스를 잠시 중단합니다.',
              //           style: TextStyle(
              //             fontSize: 14,
              //           ),
              //           overflow: TextOverflow.ellipsis,
              //           textAlign: TextAlign.center,
              //         ),
              //       ),
              //     ],
              //   ),
              // )
              // : SizedBox(),



              //하단 BottomSheet 시작
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 7,
                    child: Container(
                      height: 125,
                      decoration: BoxDecoration(
                        color: Color(0xff333D4B),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(18),
                            topLeft: Radius.circular(18)),
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '오늘 ',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'NotoSansKR',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '${DateFormat('MM.dd').format(Get.find<SettingsService>().today)} ${Util.weekdayName(Get.find<SettingsService>().today.weekday, isFull: true)}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'NotoSansKR',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '  |  ',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'NotoSansKR',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '상차 -',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'NotoSansKR',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      MaterialButton(
                                        padding: EdgeInsets.all(0),
                                        minWidth: 0,
                                        onPressed: () {
                                          Get.bottomSheet(
                                            DeliveryCardWidget(),
                                            isScrollControlled: true,
                                          );
                                        },
                                        child: Icon(
                                          Icons.arrow_drop_up,
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
                                  Image.asset('assets/icon/top-s.png'),
                                  SizedBox(width: 5),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: controller.deliveryList.length > 0 && controller.deliveryList[0].deliveryDetail[0].roadAddress != ''
                                              ? '${controller.deliveryList[0].deliveryDetail[0].roadAddress}'
                                              : '-',
                                          style: TextStyle(
                                            color: Color(0xffFFFFFF),
                                            fontSize: 14,
                                            fontFamily: 'NotoSansKR',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontFamily: 'NotoSansKR',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset('assets/icon/down-s.png'),
                                  SizedBox(width: 5),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                          controller.deliveryList.length > 0 && controller.deliveryList[0].deliveryDetail[1].roadAddress != ''
                                              ? '${controller.deliveryList[0].deliveryDetail[1].roadAddress}'
                                              : '-',
                                          style: TextStyle(
                                            color: Color(0xffFFFFFF),
                                            fontSize: 14,
                                            fontFamily: 'NotoSansKR',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontFamily: 'NotoSansKR',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            // ],
          // ),
        );
      //하단 버튼 종료
  }
}
