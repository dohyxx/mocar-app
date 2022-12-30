import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/models/cost/cost.dart';
import 'package:mocar_test/app/modules/cost/widgets/month_list_card_widget.dart';
import 'package:mocar_test/app/repositories/cost_repository.dart';
import 'package:mocar_test/app/services/settings_service.dart';


class CostController extends GetxController with GetSingleTickerProviderStateMixin {
  final globalKeys = <GlobalKey>[].obs;
  final isContentLoading = true.obs;
  ScrollController scrollController;
  CostRepository costRepository;



  var selectedMonth = Get.find<SettingsService>().today.month.obs;
  var monthList = <Widget>[].obs;

  var monthCostList = <Cost>[].obs;     //월별정산 리스트
  var monthTotalCost = 0.obs;          //월별 총 운임료
  var monthCompletedCnt = 0.obs;        //월별 총 배송완료 건수


  CostController(){
    scrollController = new ScrollController();
    costRepository = new CostRepository();

    for(var i=0; i<12; i++){
      monthList.add(MonthListCardWidget(type: i, month: i.obs +1));
    }
  }




  @override
  void onInit() {
    //loginFormKey = new GlobalKey<FormState>();
    super.onInit();

    for(var i=0; i<12; i++){
      globalKeys.add(GlobalKey());
    }
    onRefresh();
  }


  /**
   * 새로고침
   */
  void onRefresh() async {
    isContentLoading.value = true;

    getMonthCost();


    Future.delayed(Duration(milliseconds: 600)) .then((onValue)
    => isContentLoading.value = false);
  }


  /**
   *  월별정산 조회
   */
  void getMonthCost() async {
    try {
      monthCostList.clear();
      monthTotalCost.value = 0;
      monthCompletedCnt.value = 0;

      Map<String, dynamic> data = await costRepository.getMonthCost(this.selectedMonth.value.toString());
      monthCostList.addAll(data['monthCostList']);
      monthCompletedCnt.value = data['monthCompletedCnt'];
      monthTotalCost.value = int.parse(data['monthTotalCost']);


      monthCostList.refresh();
      //Get.log('<================ 월별정산 조회 in Controller: ' + data.toString());

    } catch (e) {
    }
  }

}