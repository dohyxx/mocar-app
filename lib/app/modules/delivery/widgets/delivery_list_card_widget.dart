import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/modules/delivery/controllers/delivery_controller.dart';
import 'package:mocar_test/app/modules/delivery/widgets/delivery_list_row_widget.dart';


class DeliveryListCardWidget extends GetWidget<DeliveryController> {
  int index;
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  DeliveryListCardWidget({Key key, this.index,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0),
                ),
                width: MediaQuery.of(context).size.width,
                child: ExpandableNotifier(
                  initialExpanded: false,
                  child: ExpandablePanel(
                    header: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        //ExpandablePanel header 내용 시작
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 12, 12, 16),
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
                                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '8월 31일 (수)',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontFamily: 'NotoSansKR',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              )),

                                          //TODO: 날짜가 오늘인 경우에만 표출 (분기 처리 필요)
                                          Text(
                                            '오늘',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11,
                                              fontFamily: 'NotoSansKR',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: 8,),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [

                                          Expanded(
                                            flex:3,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF5F7FA),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: Center(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                                  child: Text(
                                                    '총 125km',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontFamily: 'NotoSansKR',
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                          SizedBox(width: 8),

                                          Expanded(
                                            flex: 2,
                                            child:
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF5F7FA),
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                                child: Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                                                    child: Text(
                                                      '경유 3',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontFamily: 'NotoSansKR',
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ),

                                          SizedBox(width: 8),

                                          Expanded(
                                            flex: 5,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF5F7FA),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Image.asset(
                                                      'assets/icon/icon_3.png',
                                                   ),

                                                    Text(
                                                      '파스토 용인 1차 센터',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontFamily: 'NotoSansKR',
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
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
                    //ExpandablePanel header 내용 종료


                    //펼친 내용 시작
                    expanded:
                        ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            controller: controller.scrollController,
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return DeliveryListRowWidget(index: index);
                            }),
                    //펼친 내용 종료


                    theme: ExpandableThemeData(
                      tapHeaderToExpand: true,
                      tapBodyToExpand: false,
                      tapBodyToCollapse: false,
                      headerAlignment: ExpandablePanelHeaderAlignment.top,
                      hasIcon: true,
                      collapseIcon: Icons.keyboard_arrow_down,
                      expandIcon: Icons.keyboard_arrow_right,
                      iconPadding: EdgeInsets.only(top: 16, right: 12),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );

  }


}
