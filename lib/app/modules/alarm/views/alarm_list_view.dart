import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/modules/alarm/controllers/alarm_controller.dart';
import 'package:mocar_test/app/modules/alarm/widgets/alarm_list_widget.dart';
import 'package:mocar_test/app/modules/global_widgets/circular_loading_widget.dart';
import 'package:mocar_test/app/modules/global_widgets/empty_row.dart';
import 'package:mocar_test/app/modules/global_widgets/sub_app_bar_widget.dart';

class AlarmListView extends GetView<AlarmController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,

      // App bar 시작
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: SubAppBarWidget(appBar: AppBar(), subTitle: '알림내역'),
      ),
      // App bar 종료

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
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(mainAxisSize: MainAxisSize.max, children: [
                      //상단 설명 container 시작
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                                child: Text(
                              '고객님에게 온 알림을 확인해보세요.',
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
                    ]),
                  ),

                  SizedBox(height: 8),

                  Obx(() {
                    if (controller.isContentLoading.isTrue){
                      return new CircularLoadingWidget(height: 90);
                    }
                    else if (controller.alarmList.length > 0) {
                      return Container(
                        width: double.infinity,
                        //height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: Color(0xFFF0F4FA),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(6, 6, 6, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  controller: controller.scrollController,
                                  itemCount: controller.alarmList.length,
                                  itemBuilder: (context, index) {
                                    return AlarmListWidget(index: index);
                                  }),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return EmptyRowWidget();
                    }
                  }),

                  SizedBox(height: 0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
