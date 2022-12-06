import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/common/util.dart';
import 'package:mocar_test/app/modules/alarm/controllers/alarm_controller.dart';


class AlarmListWidget extends GetWidget<AlarmController> {
  int index;
  RxBool check = false.obs; //임시
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  AlarmListWidget({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Util.print('알림 읽음 처리');
        check.value = true;
        if(controller.alarmList[index].readYn == 'N'){
          controller.alarmSn.value = controller.alarmList[index].alarmId;
          await controller.readAlarmContent();
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Obx(() =>Container(
              decoration: BoxDecoration(
                //TODO: 색상 및 아이콘 분기 처리 필요
                color: check.value == false && controller.alarmList[index].readYn == 'N' ? Color(0xFFF0FAF7) : Colors.white,
                borderRadius: BorderRadius.circular(0),
              ),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 12, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${Util.dateForm(controller.alarmList[index].noticeDate, type: 1)}',
                                            style: TextStyle(
                                              color: Color(0xFF838C97),
                                              fontSize: 12,
                                              fontFamily: 'NotoSansKR',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 3),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${controller.alarmList[index].title}',
                                            style: TextStyle(
                                              color: Color(0xFF333D4B),
                                              fontSize: 14,
                                              fontFamily: 'NotoSansKR',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )),
                                    Obx((){
                                      if(check.value == false && controller.alarmList[index].readYn == 'N'){
                                        return Container(
                                          width: 7,
                                          height: 7,
                                          decoration: new BoxDecoration(
                                          color: Color(0xff009365),
                                          borderRadius: BorderRadius.circular(16),
                                          ),
                                        );
                                      }else{
                                        return SizedBox();
                                      }
                                    }),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 3),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${controller.alarmList[index].content}',
                                            style: TextStyle(
                                              color: Color(0xFF333D4B),
                                              fontSize: 14,
                                              fontFamily: 'NotoSansKR',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    child: Divider(
                                      color: Color(0xffd6d6d6),
                                      thickness: 1,
                                      height: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ),
          ),
        ],
      ),
    );
  }
}
