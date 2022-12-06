import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/common/util.dart';
import 'package:mocar_test/app/modules/root/controllers/root_controller.dart';



class MainMonthListRowWidget extends GetWidget<RootController> {
  int index;
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  MainMonthListRowWidget({Key key, this.index,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return InkWell(
          onTap: () {
            //Util.listDetailAlert();
          },
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text('${Util.dateForm(controller.monthCostList[index].pickupDate, type: 1)}',
                      style: TextStyle(
                        color: Color(0xff333D4B),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text('${Util.numberWithComma(controller.monthCostList[index].plusAmount, isDecimal: false)}원',
                      style: TextStyle(
                        color: Color(0xff333D4B),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Text('${Util.numberWithComma(controller.monthCostList[index].totalAmount, isDecimal: false)}원',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff333D4B),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
            ],
          ),
        );
  }
}
