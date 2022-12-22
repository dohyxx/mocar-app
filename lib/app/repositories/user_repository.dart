import 'package:get/get.dart';
import 'package:mocar_test/app/models/vehicle_model.dart';

import '../models/user_model.dart';
import '../providers/laravel_provider.dart';

class UserRepository {
  LaravelApiClient _laravelApiClient;

  final preUrl = "";

  /**
   * 회원 로그인
    */
    Future<User> login(User user) async{
      _laravelApiClient = Get.find<LaravelApiClient>();
      return _laravelApiClient.login(user);
  }



}
