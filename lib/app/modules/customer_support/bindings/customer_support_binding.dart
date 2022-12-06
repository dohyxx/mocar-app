import 'package:get/get.dart';
import 'package:mocar_test/app/modules/customer_support/controller/board_controller.dart';

class CustomerSupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BoardController>(
          () => BoardController(),
    );
  }
}
