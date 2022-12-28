
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mocar_test/app/common/util.dart';
import 'package:mocar_test/app/models/enum.dart';
import 'package:mocar_test/app/modules/delivery/controllers/delivery_controller.dart';
import 'package:mocar_test/app/modules/delivery/widgets/delivery_card_widget.dart';
import 'package:mocar_test/app/modules/delivery/widgets/delivery_list_widget.dart';
import 'package:mocar_test/app/modules/global_widgets/circular_loading_widget.dart';
import 'package:mocar_test/app/modules/global_widgets/empty_row.dart';
import 'package:mocar_test/app/modules/global_widgets/sub_app_bar_widget.dart';
import 'package:mocar_test/app/routes/app_routes.dart';
import 'package:mocar_test/app/services/settings_service.dart';



class DeliveryStatView extends GetView<DeliveryController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF0F4FA),
      resizeToAvoidBottomInset: false,

      //App bar 시작
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: SubAppBarWidget(
          appBar: AppBar(), subTitle: '배송예약'),
        ),
      //App bar 종료

      body: SafeArea(
        child: RefreshIndicator(
          key: refreshKey,
          onRefresh: () async {
            refreshKey.currentState.show(atTop: true);
            controller.onRefresh(); // 새로고침
            return null;
          },
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child:
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                      //상단 설명 container 시작
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                                child: Text(
                                  '현재까지의 예약 상황을 확인하세요.',
                                  softWrap: true,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    color: Color(0xdd838C97),
                                    fontFamily: 'NotoSansKR',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  ),
                                )),
                          ],
                        ),
                      ),

                      SizedBox(height: 16),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            SizedBox(height: 16),

                            Row(
                              children: [
                                // 진행상태 드랍다운 시작
                                Obx((){
                                  return Expanded(
                                      flex: 1,
                                      child: Util.dropdownButton<String>(
                                          controller.assignedTask,
                                          controller.rolesList.map((value) {
                                            return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value));
                                          }).toList(), (value) {
                                        //선택한 값 저장
                                        controller.assignedTask.value = value;
                                        Get.log('<===== 진행 상태 : ' + controller.assignedTask.value.toString());
                                      }));
                                }),
                                // 진행상태 드랍다운 종료

                                SizedBox(width: 10),

                                //예약번호 입력 시작
                                Expanded(
                                  flex: 2,
                                    child:Container(
                                        height: 34,
                                        padding: EdgeInsets.only(left: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(width: 1, color: Color(0xffd6d6d6)),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Flexible(
                                              child: TextField(
                                                style: TextStyle(color: Color(0xff9b9b9b)),
                                                onChanged: (String str) {
                                                },
                                                decoration: new InputDecoration.collapsed(
                                                  hintText: "예약번호",
                                                  hintStyle: TextStyle(
                                                    color: Color(0xff9b9b9b),
                                                    fontSize: 12,
                                                    fontFamily: 'NotoSansKR',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                //
                                              },
                                              child: Container(
                                                margin:
                                                const EdgeInsets.symmetric(horizontal: 4.0),
                                                child: Image.asset(
                                                  'assets/icon/ico_2_alarm_on.png',
                                                  height: 32,
                                                  width: 32,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),),
                              ],
                            ),
                            //예약번호 입력 종료

                            SizedBox(height: 16),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  // '${Util.dateForm(Get.find<SettingsService>().today, type: 1)} ~${DateFormat('dd').format(Get.find<SettingsService>().today.add(const Duration(days: 7)))}',
                                  '${Util.dateForm(DateTime(Get.find<SettingsService>().today.year, Get.find<SettingsService>().today.month, 1), type: 1)}'
                                      '~${Util.dateForm(DateTime(Get.find<SettingsService>().today.year, Get.find<SettingsService>().today.month+1, 0), type: 2).substring(8)}',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontFamily: 'NotoSansKR',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                SizedBox(width: 10,),

                                Obx(()=>
                                    Flexible(
                                      flex: 7,
                                      child: Text(
                                        '배송 총 ${controller.delTotalCnt.value}건',
                                        style: TextStyle(
                                          color: Color(0xdd00AC76),
                                          fontFamily: 'NotoSansKR',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                ),
                              ],
                            ),

                            SizedBox(height: 18),
                          ],
                        ),
                      ),
                    ]),
                  ),

                  SizedBox(height: 8),

                  //배송예약 리스트 시작
                  Obx((){
                    if (controller.isContentLoading.isTrue){
                      return new CircularLoadingWidget(height: 90);
                    }
                    else if(controller.deliveryList.length > 0){
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          controller: controller.scrollController,
                          itemCount: controller.deliveryList.length,
                          itemBuilder: (context, index) {
                            return DeliveryListWidget(index: index);
                          });
                    }else {
                      return EmptyRowWidget();
                    }
                  }),
                  //배송예약 리스트 종료


                  SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      ),

    bottomNavigationBar:
      controller.deliveryDay != null && controller.deliveryDay.delSn != null
      ? Row(
          mainAxisSize: MainAxisSize.max,
          children: [
          Expanded(
            child: GestureDetector(
              onVerticalDragUpdate: (details){
                Get.bottomSheet(
                  DeliveryCardWidget(),
                  isScrollControlled: true,
                );
              },
              child: Container(
              height: 164,
              decoration: BoxDecoration(
                color: Color(0xff333D4B),
                borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              boxShadow: [
                // BoxShadow(
                // color: Get.theme.focusColor.withOpacity(0.2),
                // blurRadius: 10,
                // offset: Offset(0, -20)),
                ],
              ),
              child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 10),
              child:
                Column(
                  children: [

                  SizedBox(height: 8),

                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                              children: [
                                TextSpan(text: '오늘 ',
                                    style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'NotoSansKR',
                                    fontWeight:
                                    FontWeight.w500,
                                  ),
                                ),
                                TextSpan(text: '${DateFormat('MM.dd').format(Get.find<SettingsService>().today)} ${Util.weekdayName(Get.find<SettingsService>().today.weekday, isFull: true)}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'NotoSansKR',
                                    fontWeight:
                                    FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                text: ' | ',
                                    style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'NotoSansKR',
                                    fontWeight:
                                    FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                text: '상차 -',
                                    style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'NotoSansKR',
                                    fontWeight:
                                    FontWeight.w500,
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
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset('assets/icon/top-s.png'),

                              SizedBox(width: 5),

                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text:
                                        '${controller.deliveryDay.deliveryDetail[0].roadAddress}',
                                      style: TextStyle(
                                        color: Color(0xffFFFFFF),
                                        fontSize: 14,
                                        fontFamily: 'NotoSansKR',
                                        fontWeight:
                                        FontWeight.w500,
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
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset('assets/icon/down-s.png'),

                                SizedBox(width: 5),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                          '${controller.deliveryDay.deliveryDetail[1].roadAddress}',
                                        style: TextStyle(
                                          color: Color(0xffFFFFFF),
                                          fontSize: 14,
                                          fontFamily: 'NotoSansKR',
                                          fontWeight:
                                          FontWeight.w500,
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
                        SizedBox(height: 16),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex:3,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F7FA),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                                    child:
                                    Text(
                                      '총 ${controller.deliveryDay.totalDistance}km',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: 'NotoSansKR',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(width: 8),

                            Expanded(
                              flex: 2,
                              child:
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F7FA),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                                    child:
                                    Text(
                                      '경유 ${controller.deliveryDay.routeCnt}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: 'NotoSansKR',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(width: 8),

                            Expanded(
                              flex: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F7FA),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(
                                        'assets/icon/icon_3.png',
                                      ),

                                      Text(
                                        '${controller.deliveryDay.deliveryDetail[1].nodeName}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontFamily: 'NotoSansKR',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
            ),
            ),
         ],
       )
          : SizedBox(),
    );
  }
}
