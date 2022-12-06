import 'dart:async';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class IntroController extends GetxController {


  IntroController() {

  }

  @override
  Future<void> onInit() async {
    super.onInit();

    Get.log('<===== 인트로 진입');

    // 1초 뒤에 화면 이동처리 한다.
    new Timer(const Duration(milliseconds: 1*1000), () {
        Get.offAllNamed(Routes.LOGINVIEW);
      }
    );
  }
}
