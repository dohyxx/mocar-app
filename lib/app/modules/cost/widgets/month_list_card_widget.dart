import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/modules/cost/controllers/cost_controller.dart';

class MonthListCardWidget extends GetWidget<CostController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final int type;
  final RxInt month;
  final Color backgroundColor;


  MonthListCardWidget(
      {Key key, this.type, this.backgroundColor, this.month
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
    Obx((){
      return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              key: controller.globalKeys[month.value-1],
              height: 35,
              decoration: BoxDecoration(
                color: controller.selectedMonth.value != month.value ? Color(0xfff7f7fa) : Color(0xff00AC76),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                    color: Color(0x14000000),
                    width: 1
                ),
              ),
              child: MaterialButton(
                onPressed: () async {
                  controller.selectedMonth.value = month.value;
                  await controller.onRefresh();
                  Get.log('<====== 월별정산 ${month.value}월 Click');

                  _scrollToColor();
                },
                child: Text(
                  '${month.value}월',
                  style: TextStyle(
                    color: controller.selectedMonth.value != month.value ? Colors.black87 : Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }


  void _scrollToColor() {
    Scrollable.ensureVisible(
      controller.globalKeys[month.value-1].currentContext,

      duration: Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }
}
