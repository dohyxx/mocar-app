import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';




class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings redirect(String route) {
    // final authService = Get.find<AuthService>();
    // Util.print('authService.isFirstAuth: ${authService.isFirstAuth}');
    // if (!authService.isAuth) {
    //   return RouteSettings(name: Routes.LOGINVIEW);
    // }else{
    //   if (authService.user.value.firstAuth == true) {
    //     // 로그인 이력 생성
    //     try {
    //       // LoginHistoryRepository loginHistoryRepository = new LoginHistoryRepository();
    //       // loginHistoryRepository.createLoginHistory(LoginTypeCd.IN);
    //     }catch(e){
    //       // Util.print(e);
    //     }
    //   }
    //
    //   authService.user.value.firstAuth = false;
      // 지문 확인 주석 처리
      // if(!authService.auth_finger)
      //   return RouteSettings(name: Routes.AUTH_LOGIN);
    // }
    // return null;
  }


}
