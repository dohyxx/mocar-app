
import 'package:dio/dio.dart' as dio;
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/common/util.dart';
import '../models/comp_model.dart';
import '../models/user_model.dart';
import '../models/vehicle_model.dart';
import '../modules/auth/controllers/auth_controller.dart';
import 'api_provider.dart';

class LaravelApiClient extends GetxService with ApiClient {
  dio.Dio _httpClient;
  dio.Options _optionsNetwork;
  dio.Options _optionsCache;

  LaravelApiClient() {
    this.baseUrl = this.globalService.global.value.laravelBaseUrl;
    _httpClient = new dio.Dio();
  }

  Future<LaravelApiClient> init() async {

      _optionsNetwork = dio.Options();
      _optionsCache = dio.Options();

      _optionsNetwork =
          buildCacheOptions(Duration(days: 3), forceRefresh: true);
      _optionsCache =
          buildCacheOptions(Duration(minutes: 10), forceRefresh: false);
      _httpClient.interceptors.add(
          DioCacheManager(CacheConfig(baseUrl: getApiBaseUrl(""))).interceptor);
    return this;
  }

  void forceRefresh({Duration duration = const Duration(minutes: 10)}) {
      _optionsCache = dio.Options();
  }

  void unForceRefresh({Duration duration = const Duration(minutes: 10)}) {
      _optionsCache = buildCacheOptions(duration, forceRefresh: false);
  }


  /**
   * 로그인 처리
   */
  Future<User> login(User user) async{
    //JWT 토큰 발급
    String _jwtToken = '';
    int _vehicleSn;
    Uri _uri = getApiBaseUri("login");
    Get.log('<==== 로그인 처리: ' +_uri.toString());
    var response = null;

    var _queryParameters = {
      'vehicleNo' : user.truckNumber.toString(),
      'phoneNo' : user.phoneNumber.toString(),
      'password' : user.password.toString(),
    };

    try{
      response = await _httpClient.postUri(_uri, data: _queryParameters, options: _optionsCache);

      if (response.data['resultCode'] == 200) {
        _jwtToken = response.data['body']['acc_token'];
        _vehicleSn = response.data['body']['vehicle_id'];
      }
      else {
        throw new Exception(response.data['message']);
      }
    }catch (e) {
      print(e);
      return null;
    }

    //사용자 정보 가져오기
    User loginUser = null;
    _uri = getApiBaseUri("info/my");
    Get.log('<==== 토큰 발급 후 사용자 정보 가져오기: ' +_uri.toString());
    _httpClient.options.headers['authorization'] = 'Bearer ${_jwtToken}';
    response = await _httpClient.postUri(_uri, options: _optionsCache);

    if (response.data['resultCode'] == 200) {
      response.data['data']['auth'] = true;
      response.data['data']['jwt_token'] = _jwtToken;
      response.data['data']['vehicle_id'] = _vehicleSn;
      loginUser = User.fromJson(response.data['data']);
    }else{
      return null;
    }

    Util.print("loginUser: ${loginUser}");
    return loginUser;
  }


  /**
   *  로그아웃
   */
  Future<void> logout() async {
    try{
      Uri _uri = getApiBaseUri("logout");
      Get.log('<==== _uri : ' +_uri.toString());

      var jwtToken = Get.find<AuthController>().user.value.jwtToken;
      _httpClient.options.headers['authorization'] = 'Bearer ${jwtToken}';
      await _httpClient.postUri(_uri, options: _optionsCache);
    } catch(e) {
    }
  }



  /**
   *  내 정보 조회
   */
  Future<void> getUserInfo() async{
    try{
      var _authController = Get.find<AuthController>();
      Uri _uri = getApiBaseUri("info/my");
      Get.log('<==== _uri : ' +_uri.toString());

      var jwtToken = Get.find<AuthController>().user.value.jwtToken;
      _httpClient.options.headers['authorization'] = 'Bearer ${jwtToken}';
      var response = await _httpClient.postUri(_uri, options: _optionsCache);
      var data = Map<String, dynamic>();
      data = response.data['data'];

      _authController.user.value.user_sn = data['id'];
      _authController.user.value.email = data['email'];
      _authController.user.value.driverNm = data['driver_nm'];
      _authController.user.value.phoneNumber = data['phone_no'];

      // Get.find<AuthController>().user.value = User.fromJson(data);

    }catch(e){
    }
  }



  /**
   *  내 차량 조회
   */
  Future<void> getUserVehicle() async{
    try{
      Uri _uri = getApiBaseUri("info/vehicles");
      Get.log('<==== _uri : ' +_uri.toString());

      var jwtToken = Get.find<AuthController>().user.value.jwtToken;
      _httpClient.options.headers['authorization'] = 'Bearer ${jwtToken}';
      var response = await _httpClient.postUri(_uri, options: _optionsCache);
      var data = Map<String, dynamic>();
      data = response.data['data'][0];
      Get.find<AuthController>().vehicle.value = Vehicle.fromJson(data);
    }catch(e){
      Get.log('${e}');
    }
  }



  /**
   *  내 업체 조회
   */
  Future<void> getUserComp() async{
    try{
      Uri _uri = getApiBaseUri("info/comp");
      Get.log('<==== _uri : ' +_uri.toString());

      var jwtToken = Get.find<AuthController>().user.value.jwtToken;
      _httpClient.options.headers['authorization'] = 'Bearer ${jwtToken}';

      var response = await _httpClient.postUri(_uri, options: _optionsCache);
      var data = Map<String, dynamic>();
      data = response.data['data'];

      Get.find<AuthController>().comp.value = Comp.fromJson(data);
    }catch(e){
      Get.log('${e}');
    }
  }
}
