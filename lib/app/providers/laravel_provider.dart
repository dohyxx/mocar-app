
import 'package:dio/dio.dart' as dio;
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:get/get.dart';
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
  Future<String> login(User user) async{
    try{
      var _queryParameters = {
        'vehicleNo' : user.carNumber.toString(),
        'phoneNo' : user.phoneNumber.toString(),
        'password' : user.password.toString(),
      };

      Uri _uri = getApiBaseUri("login");
      Get.log('<==== _uri : ' +_uri.toString());
      Get.log('<==== _queryParameters : ' +_queryParameters.toString());

      var response = await _httpClient.postUri(_uri, data: _queryParameters, options: _optionsCache);
      Get.log('<==== 로그인 API : ' +response.data.toString());

      if (response.data['resultCode'] == 200) {
        user.jwtToken = response.data['body']['acc_token'];
        return response.data['resultMessage'];
      }
      else {
        return response.data['message'];
      }
    }catch (e) {
    }
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
