import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mocar_test/app/common/util.dart';

import '../models/user_model.dart';
import '../repositories/user_repository.dart';

class AuthService extends GetxService {
  final user = User().obs;
  GetStorage _box;

  UserRepository _usersRepo;

  AuthService() {
    _usersRepo = new UserRepository();
    _box = new GetStorage();
  }

  Future<AuthService> init() async {
    user.listen((User _user) {
      _box.write('current_user', _user.toJson());
      Util.print('init current_user: ${_box.read('current_user')}');
    });
    await getCurrentUser();
    return this;
  }

  Future getCurrentUser() async {
    Util.print('getCurrentUser current_user: ${_box.read('current_user')}');

    if (user.value.auth == null && _box.hasData('current_user')) {
      user.value = User.fromJson(await _box.read('current_user'));
      user.value.auth = true;
      Util.print('current_user if: ${_box.read('current_user')}');

    } else {
      user.value.auth = false;
      Util.print('current_user else: ${_box.read('current_user')}');
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

      if (authService.isAuth) {

      }
      authService.user.value.firstAuth = true;
    }catch(e){
      Util.print(e);
    }

    user.value = new User();
    await _box.remove('current_user');
  }

  bool get isAuth => user.value.auth ?? false;

  bool get isFirstAuth => user.value.firstAuth ?? true;
}
