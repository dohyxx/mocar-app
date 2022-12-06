import 'package:dio/dio.dart' as dio;
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:get/get.dart';
import 'package:mocar_test/app/modules/auth/controllers/auth_controller.dart';

import '../providers/api_provider.dart';

/**
 * 베이스 레파지토리
 */
class BaseRepository extends GetxService with ApiClient {
  dio.Dio httpClient;
  dio.Options optionsNetwork;
  dio.Options optionsCache;

  BaseRepository() {
    this.baseUrl = this.globalService.global.value.laravelBaseUrl;
    httpClient = new dio.Dio();

    httpClient.options.connectTimeout = 200000;     // 200s 서버로부터 응받을때까지의 시간
    httpClient.options.receiveTimeout = 200000;     // 200s 서버로 부터 응답을 스트리밍?으로 받는 중에 연결 지속 시간

    // 헤더 정보에 k토큰값을 추가
    if(Get.find<AuthController>().user.value.jwtToken != null || Get.find<AuthController>().user.value.jwtToken.isNotEmpty){
      httpClient.options.headers['authorization'] = 'Bearer ${Get.find<AuthController>().user.value.jwtToken}';
    }
  }

  Future<BaseRepository> init() async {

    if (foundation.kIsWeb || foundation.kDebugMode) {
      optionsNetwork = dio.Options();
      optionsCache = dio.Options();
    } else {
      optionsNetwork = buildCacheOptions(Duration(days: 3), forceRefresh: true);
      optionsCache = buildCacheOptions(Duration(minutes: 10), forceRefresh: false);
      httpClient.interceptors.add(DioCacheManager(CacheConfig(baseUrl: getApiBaseUrl(""))).interceptor);
    }
    return this;
  }
}
