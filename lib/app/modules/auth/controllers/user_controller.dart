import 'package:get/get.dart';
import 'package:mocar_test/app/repositories/user_repository.dart';

class UserController extends GetxController {
  UserRepository _userRepository;

  UserController() {
    _userRepository = UserRepository();
  }

  @override
  void onInit() async {
    super.onInit();
    await onRefresh();
  }

  /**
   * 새로고침
   */
  Future<void> onRefresh() async {
    Get.log('<====== onRefresh');
  }
}
