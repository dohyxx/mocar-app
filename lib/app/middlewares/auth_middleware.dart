import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/common/util.dart';
import 'package:mocar_test/app/routes/app_routes.dart';
import 'package:mocar_test/app/services/auth_service.dart';


class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings redirect(String route) {
    final authService = Get.find<AuthService>();
    if (!authService.isAuth) {
      return RouteSettings(name: Routes.LOGINVIEW);
    }else{
        try {
          //Util.print('AuthMiddleware 유저 권한 있음: ${authService.user.value}');

        }catch(e){
          Util.print(e);
        }
    }
    return null;
  }


}
