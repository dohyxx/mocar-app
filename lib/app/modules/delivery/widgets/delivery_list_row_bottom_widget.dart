import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/modules/delivery/controllers/delivery_controller.dart';

class DeliveryListRowBottomWidget extends GetWidget<DeliveryController> {
  int index;
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  DeliveryListRowBottomWidget({
    Key key,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, top: 8, right: 20, bottom: 8),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/icon/point.png',
                        ),
                        SizedBox(width: 5),
                        Text(
                          '상차지 ${index+1}',
                          style: TextStyle(
                            fontFamily: 'Noto Sans',
                            fontSize: 12,
                            color: Color(0xFF00AC76),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),

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

                    //TODO: 확정 or 취소 분기 처리 필요
                    Obx(
                      () => Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(width: 1, color: Color(0xff00AC76)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          child: Text(
                            controller.deliveryList[index].dispatchStatus.isNotEmpty? '확정' : '취소',
                            style: TextStyle(
                              fontFamily: 'Noto Sans',
                              fontSize: 12,
                              color: Color(0xff00AC76),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: Row(
                    children: [
                      Text(
                        'ABCDE00005014654',
                        style: TextStyle(
                          fontFamily: 'Noto Sans',
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        ' | ',
                        style: TextStyle(
                          fontFamily: 'Noto Sans',
                          fontSize: 13,
                          color: Color(0xff333D4B),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '파레트 KPP / 0개',
                        style: TextStyle(
                          fontFamily: 'Noto Sans',
                          fontSize: 13,
                          color: Color(0xff333D4B),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 5,
                  color: Color(0xffE1E6EB),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
