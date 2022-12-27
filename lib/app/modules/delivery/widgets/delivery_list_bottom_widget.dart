import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/models/delivery/delivery_detail.dart';
import 'package:mocar_test/app/modules/delivery/controllers/delivery_controller.dart';
import 'package:mocar_test/app/models/enum.dart';




class DeliveryListBottomWidget extends GetWidget<DeliveryController> {
  int index;
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  DeliveryListBottomWidget({Key key, this.index,
  }) : super(key: key);

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
                // width: MediaQuery.of(context).size.width,
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
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
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

                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/icon/point.png',
                                              ),

                                              SizedBox(width: 2),

                                              Text(
                                                '${controller.deliveryDay.deliveryDetail[index].nodeTypeCd.codeName}',
                                                style: TextStyle(
                                                  fontFamily: 'Noto Sans',
                                                  fontSize: 12,
                                                  color: Color(0xFF00AC76),
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),

                                          SizedBox(width: 16),

                                          Row(
                                            children: [
                                              Text(
                                                '',
                                                style: TextStyle(
                                                  fontFamily: 'Noto Sans',
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),

                                          SizedBox(width: 30),

                                        ],
                                      ),

                                      SizedBox(height: 8,),

                                      Row(
                                        children: [

                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                color: Color(0xffE1E6EB),
                                              ),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 3),
                                                child: Text(
                                                  '도로명',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 11,
                                                    fontFamily: 'NotoSansKR',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                          SizedBox(width: 12),

                                          Center(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                                              child: Text(
                                                '${controller.deliveryDay.deliveryDetail[index].roadAddress}',
                                                style: TextStyle(
                                                  color: Color(0xff333D4B),
                                                  fontSize: 14,
                                                  fontFamily: 'NotoSansKR',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: 3),

                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                color: Color(0xffE1E6EB),
                                              ),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 19, vertical: 3),
                                                child: Text(
                                                  '지번',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 11,
                                                    fontFamily: 'NotoSansKR',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                          SizedBox(width: 12),

                                          Center(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                                              child: Text(
                                                '${controller.deliveryDay.deliveryDetail[index].roadAddrDetail}',
                                                style: TextStyle(
                                                  color: Color(0xff333D4B),
                                                  fontSize: 14,
                                                  fontFamily: 'NotoSansKR',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: 8),


                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/icon/clock.png',
                                              ),

                                              SizedBox(width: 5),

                                              Text(
                                                '상차 -',
                                                style: TextStyle(
                                                  fontFamily: 'Noto Sans',
                                                  fontSize: 13,
                                                  color: Colors.black87,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),

                                          //TODO: Image && Text 분기 처리 필요 (상/하차완료 - 사진 요망 - 픽업사진)
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF5F7FA),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(
                                                color: Color(0xffE1E6EB),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    'assets/icon/photo.png',
                                                  ),

                                                  SizedBox(width: 5),

                                                  Text(
                                                    '-',
                                                    style: TextStyle(
                                                      color: Color(0xff00AC76),
                                                      fontSize: 12,
                                                      fontFamily: 'NotoSansKR',
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),

                                                  SizedBox(width: 5),

                                                  Text(
                                                    '|',
                                                    style: TextStyle(
                                                      color: Color(0xffE1E6EB),
                                                      fontSize: 12,
                                                      fontFamily: 'NotoSansKR',
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),

                                                  SizedBox(width: 5),

                                                  Text(
                                                    '-',
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
                                        ],
                                      ),

                                      SizedBox(height: 16),

                                      Divider(
                                        color: Color(0xffE1E6EB),
                                        thickness: 1,
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
                    // expanded:
                    //     ListView.builder(
                    //         scrollDirection: Axis.vertical,
                    //         shrinkWrap: true,
                    //         physics: const NeverScrollableScrollPhysics(),
                    //         controller: controller.scrollController,
                    //         itemCount: controller.deliveryList[index].deliveryDetail.length,
                    //         itemBuilder: (context, index) {
                    //           return DeliveryListRowBottomWidget(index: index);
                    //         }),
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
