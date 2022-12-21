import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../routes/app_routes.dart';

class IntroController extends GetxController {
  GetStorage _box;


  IntroController() {
    _box = new GetStorage();
  }

  @override
  Future<void> onInit() async {
    super.onInit();

    Get.log('<===== 인트로 진입');

    // 1초 뒤에 화면 이동처리 한다.
    new Timer(const Duration(milliseconds: 1*1000), () {
          //메인 화면 이동 후 권한 여부 체크
          Get.offAllNamed(Routes.MAINVIEW);
      }
    );
  }
}
