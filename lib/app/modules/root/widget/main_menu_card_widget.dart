import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/common/images.dart';
import 'package:mocar_test/app/modules/delivery/controllers/delivery_controller.dart';
import 'package:mocar_test/app/modules/root/controllers/root_controller.dart';
import 'package:mocar_test/app/routes/app_routes.dart';
import 'package:mocar_test/app/services/driver_work_service.dart';

class MainMenuCardWidget extends GetWidget<RootController> {
  final RxInt type;
  final String name;

  RxInt count = 0.obs;
  var targetPage;
  var menuLogo;

  MainMenuCardWidget({Key key, this.type, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    switch(type.value){
      case 0: count.value = Get.find<DeliveryController>().delTotalCnt.value;
              menuLogo = Images.menuLogo1;
              targetPage = Routes.DELIVERYSTAT;
              break;
      case 1: count.value = controller.routCnt.value;
              menuLogo = Images.menuLogo2;
              targetPage = Routes.DELIVERYROUTE;
              break;
      case 2: count.value = controller.costCnt.value;
              menuLogo = Images.menuLogo3;
              targetPage = Routes.COSTLIST;
              break;
      case 3: count.value = controller.photoCnt.value;
              menuLogo = Images.menuLogo4;
              targetPage = Routes.COMPLETEDPHOTO;
              break;
      case 4: count.value = controller.alarmCnt.value;
              menuLogo = Images.menuLogo5;
              targetPage = Routes.ALARMLIST;
              break;
      case 5: count.value = controller.noticeCnt.value;
              menuLogo = Images.menuLogo6;
              targetPage = Routes.NOTICELIST;
              break;
      default:
    }

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Obx(() => MaterialButton(
                        onPressed: () async {
                          if(type.value != 1){
                            if(type.value == 0) await Get.find<DeliveryController>().onRefresh();
                            Get.toNamed(targetPage);
                          }else{
                            controller.toggleYn.value = 1;
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      type.value != 1 && type.value != 3 ? '${count.value}건' : '',
                                      style: TextStyle(
                                        color: Color(0xff00AC76),
                                        fontFamily: 'NotoSansKR',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                            Image.asset(menuLogo),

                            SizedBox(height: 3),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${this.name}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'NotoSansKR',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),

                                SizedBox(width: 3),

                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                  size: 15,
                                )
                              ],
                            ),
                          ],
                        )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
