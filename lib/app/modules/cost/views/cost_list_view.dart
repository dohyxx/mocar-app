import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/modules/auth/controllers/auth_controller.dart';
import 'package:mocar_test/app/modules/cost/controllers/cost_controller.dart';
import 'package:mocar_test/app/modules/cost/widgets/month_list_card_widget.dart';
import 'package:mocar_test/app/modules/cost/widgets/month_list_widget.dart';
import 'package:mocar_test/app/modules/global_widgets/circular_loading_widget.dart';
import 'package:mocar_test/app/modules/global_widgets/sub_app_bar_widget.dart';


class CostListView extends GetView<CostController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: SubAppBarWidget(appBar: AppBar(), subTitle: '월별정산'),
      body: SafeArea(
        child: RefreshIndicator(
          key: refreshKey,
          // edgeOffset: -200,    // 안보이게 처리
          onRefresh: () async {
            refreshKey.currentState.show(atTop: true);
            // 새로고침
            controller.onRefresh();
            return null;
          },
          child: Container(
            color: Colors.white,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [

                // 월별 카드 위젯 시작
                Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18),
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Container(
                    color: Colors.white,
                    height: 90,
                    child: GridView.count(
                      scrollDirection: Axis.horizontal,
                      crossAxisCount: 1,
                      mainAxisSpacing: 9,
                      childAspectRatio: (20 / 25),
                      children:
                        controller.monthList
                    )),
                  ),
                ),
                // 월별 카드 위젯 종료


                // 월별 정산명세서 위젯 시작
                  Obx((){
                    if (controller.isContentLoading.isTrue){
                      return new CircularLoadingWidget(height: 90);
                    }else{
                      return MonthListWidget();
                    }
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
