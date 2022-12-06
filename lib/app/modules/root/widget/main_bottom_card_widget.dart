import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/common/util.dart';
import 'package:mocar_test/app/modules/global_widgets/empty_row.dart';
import 'package:mocar_test/app/modules/root/controllers/root_controller.dart';
import 'package:mocar_test/app/modules/root/widget/main_month_list_row_widget.dart';
import 'package:mocar_test/app/services/settings_service.dart';


class MainBottomCardWidget extends GetWidget<RootController> {

  MainBottomCardWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                  ),
                ),
                child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '정산 기간',
                              style: TextStyle(
                                color: Color(0xff00AC76),
                                fontSize: 13,
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            Text(
                              '${Util.dateForm(DateTime(Get.find<SettingsService>().today.year, Get.find<SettingsService>().today.month, 1), type: 2)}'
                                  '~${Util.dateForm(DateTime(Get.find<SettingsService>().today.year, Get.find<SettingsService>().today.month+1, 0), type: 2).substring(8)}',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 13,
                              fontFamily: 'NotoSansKR',
                              fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 5),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '총 배송완료',
                              style: TextStyle(
                                color: Color(0xff00AC76),
                                fontSize: 13,
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            Text(
                              '${controller.costCnt.value}건',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 13,
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 20),

                        Divider(
                          color: Color(0xffE1E6EB),
                          thickness: 1,
                        ),

                        SizedBox(height: 8),

                        //월별 정산 명세서 상세 리스트 시작
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text('픽업일자',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),

                            Expanded(
                              flex: 2,
                              child: Text('추가운임',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),

                            Expanded(
                              flex: 0,
                              child: Text('배송 총 운임',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 12),

                          Obx((){
                            if(controller.monthCostList.length > 0){
                              return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  controller: controller.scrollController,
                                  itemCount: controller.monthCostList.length,
                                  itemBuilder: (context, index) {
                                    return MainMonthListRowWidget(index: index);
                                  });
                            }else {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  EmptyRowWidget(),
                                ],
                              );
                            }
                          }),
                       //월별 정산 명세서 상세 리스트 시작

                      ],
                    ),
                  ),
              ),
            ),
          ],
        );
      }
  }

