import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/modules/customer_support/widgets/notice_list_widget.dart';
import 'package:mocar_test/app/modules/customer_support/controller/board_controller.dart';
import 'package:mocar_test/app/modules/global_widgets/empty_row.dart';
import 'package:mocar_test/app/modules/global_widgets/sub_app_bar_widget.dart';

class NoticeListView extends GetView<BoardController> {
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
        child: SubAppBarWidget(appBar: AppBar(), subTitle: '전체공지'),
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

                      SizedBox(height: 16),
                    ]),
                  ),

                  // 운반 일정 목록
                  SizedBox(height: 8),

                  Obx((){
                    if(controller.noticeList.length > 0){
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          controller: controller.scrollController,
                          itemCount: controller.noticeList.length,
                          itemBuilder: (context, index) {
                            return NoticeListWidget(index: index);
                          });
                    }else {
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
