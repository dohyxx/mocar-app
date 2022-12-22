import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mocar_test/app/common/util.dart';
import '../models/user_model.dart';

class AuthService extends GetxService {
  final user = User().obs;
  GetStorage _box;


  AuthService() {
    _box = new GetStorage();
  }

  Future<AuthService> init() async {

    user.listen((User _user) {
      _box.write('current_user', _user.toJson());
    });
    Get.log('[AuthService] 현재 유저 정보:  ${_box.read('current_user')}');

    await getCurrentUser();
    return this;
  }

  Future getCurrentUser() async {
    if (user.value.auth == null && _box.hasData('current_user')) {
      user.value = User.fromJson(await _box.read('current_user'));
      user.value.auth = true;
    } else {
      user.value.auth = false;
    }
  }


  /**
   * 로그아웃 처리
   */
  Future removeCurrentUser() async {
    // 로그아웃 이력 생성
    try {
      final authService = Get.find<AuthService>();

      Util.print('로그아웃 처리: ${authService.user.value}');

      user.value = new User();
      await _box.remove('current_user');
      //await _box.remove('remember_checked');
    }catch(e){
      Util.print(e);
    }

  }

  bool get isAuth => user.value.auth ?? false;

}
