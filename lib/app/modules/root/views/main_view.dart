import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/common/util.dart';
import 'package:mocar_test/app/modules/delivery/controllers/delivery_controller.dart';
import 'package:mocar_test/app/modules/global_widgets/circular_loading_widget.dart';
import 'package:mocar_test/app/modules/global_widgets/empty_row.dart';
import 'package:mocar_test/app/modules/root/controllers/root_controller.dart';
import 'package:mocar_test/app/modules/root/views/whole_path_view.dart';
import 'package:mocar_test/app/modules/root/widget/animated_toggle_widget.dart';
import 'package:mocar_test/app/modules/root/widget/main_bottom_widget.dart';
import 'package:mocar_test/app/modules/root/widget/main_card_widget.dart';
import 'package:mocar_test/app/modules/root/widget/main_menu_card_widget.dart';
import 'package:mocar_test/app/modules/auth/widgets/user_info_widget.dart';
import 'package:mocar_test/app/routes/app_routes.dart';
import 'package:mocar_test/app/services/auth_service.dart';
import 'package:mocar_test/app/services/settings_service.dart';


class MainView extends GetView<RootController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var refreshKey = GlobalKey<RefreshIndicatorState>();


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if(controller.toggleYn.value != 0){
          Future.delayed(const Duration(milliseconds: 300), () async {
            controller.toggleYn.value = 0;
          });
          return null;
        }else{
         return _onWillPop(context);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          toolbarHeight: Get.width * 0.18,
          title: Image.asset(
            'assets/icon/main.png',
          ),
          actions: [
            Obx(
              () => Row(
                children: [
                  Text(
                    '메뉴',
                    style: TextStyle(
                      color: controller.toggleYn.value == 0
                          ? Color(0xff00AC76)
                          : Color(0xff333D4B),
                      fontFamily: 'NotoSansKR',
                      fontWeight: controller.toggleYn.value == 0 ? FontWeight.w700 : FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  AnimatedToggleWidget(
                    initialPosition: controller.toggleYn.value == 0 ? true : false,
                    onToggleCallback: (value) async {
                      if(Get.find<DeliveryController>().deliveryDay.delSn != null){
                        Future.delayed(Duration(milliseconds: 120))
                            .then((onValue) => controller.toggleYn.value = value);
                      }else{
                        Util.alert('오늘 배송이 없습니다.', callback: (){
                        });
                      }
                    },
                  ),
                  Text(
                    '경로',
                    style: TextStyle(
                      color: controller.toggleYn.value != 0
                          ? Color(0xff00AC76)
                          : Color(0xff333D4B),
                      fontFamily: 'NotoSansKR',
                      fontWeight: controller.toggleYn.value != 0 ? FontWeight.w700 : FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0,
        ),
        body: Obx(
          () => controller.toggleYn == 0
              ? SafeArea(
                  child: RefreshIndicator(
                    key: refreshKey,
                    // edgeOffset: -200,    // 안보이게 처리
                    onRefresh: () async {
                      refreshKey.currentState.show(atTop: true);
                      // 새로고침
                      await Get.find<DeliveryController>().getDeliveryList();
                      controller.onRefresh();

                      return null;
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xffd6d6d6),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          fit: FlexFit.tight,
                                          flex: 5,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: Image.asset(
                                                  'assets/icon/icon_4.png',
                                                  // height: 56,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                flex: 9,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${Get.find<AuthService>().user.value.driverNm} 기사님',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: Colors.black87,
                                                        fontFamily: 'NotoSansKR',
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                      ),
                                                    ),
                                                    Text.rich(
                                                      TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: '오늘도 안전 운행하세요!',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black87,
                                                              fontSize: 13,
                                                              fontFamily:
                                                                  'NotoSansKR',
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                              fontStyle: FontStyle
                                                                  .normal,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          fit: FlexFit.tight,
                                          flex: 4,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Get.bottomSheet(
                                                    UserInfoWidget(),
                                                    isScrollControlled: true,
                                                  );
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF00AC76),
                                                    borderRadius:
                                                        BorderRadius.circular(6),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 12,
                                                        vertical: 6),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          '내정보 보기 ',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily:
                                                                'NotoSansKR',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14,
                                                            fontStyle:
                                                                FontStyle.normal,
                                                          ),
                                                        ),
                                                        SizedBox(width: 5),
                                                        Icon(
                                                          Icons.arrow_drop_down,
                                                          color: Colors.white,
                                                          size: 20,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Obx((){
                            if(controller.alarmList.length > 0){
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
                                child: Container(
                                    height: 133,
                                    child: GridView.builder(
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1, //1 개의 행에 보여줄 item 개수
                                        childAspectRatio: 1.2 / 2, //item 의 가로 1, 세로 2 의 비율
                                        mainAxisSpacing: 14, //수평 Padding
                                        //crossAxisSpacing: 10, //수직 Padding
                                      ),
                                      //controller: controller.scrollController,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller.alarmList.length,
                                      itemBuilder:(BuildContext context, int index) {
                                        return MainCardWidget(index: index);
                                      },
                                    )),
                              );
                            }else{
                              return EmptyRowWidget(title: '알림 내역 없음', height: 133);
                            }
                          }),


                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: InkWell(
                              onTap: (){
                                Get.toNamed(Routes.ALARMLIST);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '전체',
                                    style: TextStyle(
                                        fontSize: 12, fontWeight: FontWeight.w700),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                    size: 12,
                                  )
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 16),

                          Obx((){
                            if (controller.isContentLoading.isTrue){
                              return new CircularLoadingWidget(height: 90);
                            }else{
                              return Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffF0F4FA),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15), topLeft: Radius.circular(15),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 25),
                                  child: GridView.count(
                                    controller: PrimaryScrollController.of(context) ??
                                        controller.scrollController,
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 2,
                                    mainAxisSpacing: 2,
                                    childAspectRatio: (80 / 50),
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      MainMenuCardWidget(type: 0.obs, name: '배송예약'),
                                      MainMenuCardWidget(type: 1.obs, name: '경로맵'),
                                      MainMenuCardWidget(type: 2.obs, name: '월별정산'),
                                      MainMenuCardWidget(type: 3.obs, name: '완료사진'),
                                      MainMenuCardWidget(type: 4.obs, name: '알림내역'),
                                      MainMenuCardWidget(type: 5.obs, name: '전체공지'),
                                    ],
                                  ),
                                ),
                              );
                            }
                          }),

                        ],
                      ),
                    ),
                  ),
                )
              : WholePathView(),
        ),

        //하단
        bottomNavigationBar: Obx(
          () =>
          controller.toggleYn.value == 0
              ? Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onVerticalDragUpdate: (details){
                          Get.bottomSheet(
                            MainBottomWidget(),
                            isScrollControlled: true,
                          );
                        },
                        child: Container(
                          height: 104,
                          decoration: BoxDecoration(
                            color: Color(0xff333D4B),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20)),
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
                                              text: '${Get.find<SettingsService>().today.month}월 ',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'NotoSansKR',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '정산 명세서',
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
                                              //메인 하단 팝업 펼진 내용 시작
                                              Get.bottomSheet(
                                                MainBottomWidget(),
                                                isDismissible: true,
                                                isScrollControlled: true,
                                                enableDrag: true,

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
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${Util.numberWithComma(controller.monthTotalCost.value,isDecimal: false)}원',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700),
                                      ),
                                        Text(
                                          controller.monthCostList.length != 0  && controller.monthCostList != null
                                            ? '최근 ${Util.dateForm(controller.monthCostList[0].pickupDate, type: 1)}  ${Util.numberWithComma(controller.monthCostList[0].totalAmount, isDecimal: false)}원'
                                            : '최근 내역 없음',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
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
                    ),
                  ],
                )
              : SizedBox(),
        ),
      ),
    );
  }
}



Future<bool> _onWillPop(context) async {
  return (await showDialog(
    context: context,
    builder: (context) => new AlertDialog(
      // title: new Text('',
      //   style: TextStyle(
      //   color: Colors.black87,
      //   fontSize: 20,
      //   fontFamily: 'NotoSansKR',
      //   fontWeight: FontWeight.w400,
      //   ),
      // ),
      content: new Text('모카 앱을 종료하시겠습니까?',
        style: TextStyle(
          color: Colors.black87,
          fontSize: 20,
          fontFamily: 'NotoSansKR',
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: <Widget>[
        new TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: new Text('아니오',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontFamily: 'NotoSansKR',
              fontWeight: FontWeight.w400,
            ),),
        ),
        new TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: new Text('예',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontFamily: 'NotoSansKR',
              fontWeight: FontWeight.w400,
            ),),
        ),
      ],
    ),
  )) ?? false;
}
