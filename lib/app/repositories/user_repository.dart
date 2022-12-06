import 'package:get/get.dart';

import '../models/user_model.dart';
import '../providers/laravel_provider.dart';

class UserRepository {
  LaravelApiClient _laravelApiClient;

  final preUrl = "";

  /**
   * 회원 로그인
    */
    Future<String> login(User user) async{
      _laravelApiClient = Get.find<LaravelApiClient>();
      return _laravelApiClient.login(user);
  }



  /**
   * 로그아웃 처리
   */
  Future<void> logout() async {
    try {
      _laravelApiClient = Get.find<LaravelApiClient>();
      await _laravelApiClient.logout();
    }
    catch(e) {
    }
  }



  /**
   *  내 정보 조회
   */
  Future<void> getUserInfo() async{
    _laravelApiClient = Get.find<LaravelApiClient>();
    await _laravelApiClient.getUserInfo();
    await _laravelApiClient.getUserVehicle();
    await _laravelApiClient.getUserComp();
  }
}
