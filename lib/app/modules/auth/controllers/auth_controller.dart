import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mocar_test/app/common/util.dart';
import 'package:mocar_test/app/models/user_model.dart';
import 'package:mocar_test/app/modules/auth/controllers/user_controller.dart';
import 'package:mocar_test/app/repositories/user_repository.dart';
import 'package:mocar_test/app/routes/app_routes.dart';
import 'package:mocar_test/app/services/auth_service.dart';
import '../../../models/comp_model.dart';
import '../../../models/vehicle_model.dart';



class AuthController extends GetxController with GetSingleTickerProviderStateMixin {
  final Rx<User> currentUser = Get.find<AuthService>().user;

  // GlobalKey<FormState> loginFormKey;
  final isContentLoading = true.obs;
  ScrollController scrollController;

  //로그인
  final user = User().obs;
  final vehicle = Vehicle().obs;
  final comp = Comp().obs;
  UserRepository _userRepository;

  final menuList = ['배송예약', '경로맵', '월별정산', '완료사진', '알림내역', '전체공지'].obs;


  //로그인 입력
  var phoneNumber = TextEditingController();
  var pwdInput = TextEditingController();
  var carNumber = TextEditingController();


  // 로그인 유지 여부
  final isRememberMe = false.obs;
  GetStorage storage = new GetStorage();


  //드랍다운
  var assignedTask = '진행상태'.obs;
  final rolesList = ['진행상태1', '진행상태2', '진행상태3'].obs;



  AuthController(){
    scrollController = new ScrollController();
    _userRepository = UserRepository();
  }



  /**
   * AuthController 생성 시 맨 처음 한번만 실행.
   */
  @override
  void onInit() {
    //loginFormKey = new GlobalKey<FormState>();
    super.onInit();
    onRefresh();
  }


  /**
   * 새로고침
   */
  void onRefresh() async {
    isContentLoading.value = true;

    Future.delayed(Duration(milliseconds: 600)) .then((onValue)
    => isContentLoading.value = false);
  }


  /**
   *  회원 로그인
   */
  void login() async {

    isContentLoading.value = true;
    try {
      //자동 로그인 여부
      storage.write('remember_checked', isRememberMe.value.toString());
      Util.print('remember_checked: '+ storage.read('remember_checked'));


      currentUser.value.truckNumber = carNumber.text;
      currentUser.value.phoneNumber = phoneNumber.text;
      currentUser.value.password = pwdInput.text;

      // currentUser.value.truckNumber = '88가8888';
      // currentUser.value.phoneNumber = '01088887278';
      // currentUser.value.password = '72788888';

      var user = await _userRepository.login(currentUser.value);

      if(user != null) {
        //입력값 초기화
        carNumber.text = '';
        phoneNumber.text = '';
        pwdInput.text = '';
        isRememberMe.value = false;

        currentUser.value = user;

        //await Get.put(UserController());

        Future.delayed(const Duration(milliseconds: 1000), (){
          Get.offAllNamed(Routes.MAINVIEW);
        });
      }else{
        Util.alert('로그인 정보가 일치하지 않습니다.');
      }

      } catch (e) {
        Util.print('로그인 중 에러가 발생하였습니다.');
        Util.print(e);
      }
  }


  /**
   * 로그아웃 처리
   */
  Future<void> logout() async {
    try {
      await _userRepository.logout();

      user.value = new User();
      vehicle.value = new Vehicle();
      comp.value = new Comp();
      phoneNumber.clear();
      pwdInput.clear();
      carNumber.clear();
    }
    catch(e) {
      Get.log('${e}');
    }
  }
}