import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/common/util.dart';
import 'package:mocar_test/app/modules/root/controllers/root_controller.dart';
import 'package:mocar_test/app/services/settings_service.dart';


class MainCardWidget extends GetWidget<RootController> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  int index;

  MainCardWidget({Key key,
    this.index,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return Obx((){
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Util.dateForm(Get.find<SettingsService>().today) == Util.dateForm(controller.alarmList[index].noticeDate) ?
                    Row(
                      children: [
                        Image.asset('assets/icon/bell.png',
                          height: 16,
                          width: 16,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: 5),

                        Text('오늘',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    )
                    : SizedBox(width: 15),

                    SizedBox(width: 5),

                    Text('${Util.dateForm(controller.alarmList[index].noticeDate, type: 1).substring(5)}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(35, 10, 0 ,10),
                  child: Row(
                    children: [
                      Image.asset(
                        index == 0
                            ?'assets/icon/dot.png'
                            : 'assets/icon/dot2.png',
                        width: 7,
                        height: 7,
                      ),
                      Expanded(
                        child: Image.asset('assets/icon/line.png',
                          width: Get.width * 0.3,
                        ),
                      ),


                    ],
                  ),
                ),

                SizedBox(height: 8),

                Container(
                  height: 65,
                  decoration: BoxDecoration(
                    color: index == 0 ? Color(0xffF5F7FA) : Colors.white,
                    border: Border.all(
                      color: Color(0xffd6d6d6),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 5,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 9,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${controller.alarmList[index].title}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontFamily: 'NotoSansKR',
                                            fontSize: 12.5,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),

                                        InkWell(
                                          onTap: (){
                                            Get.log('Button Click....');
                                          },
                                          child: Icon(
                                            Icons.close,
                                            color: Color(0xff333D4B),
                                            size: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),

                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '${controller.alarmList[index].content}',
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 12,
                                              fontFamily: 'NotoSansKR',
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
          );
        });
  }
}
