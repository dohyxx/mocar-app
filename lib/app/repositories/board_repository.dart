import 'package:get/get_core/src/get_main.dart';
import 'package:mocar_test/app/models/notice_model.dart';
import 'base_repository.dart';

class BoardRepository extends BaseRepository{

  /**
   * 공지사항 조회
   */
  Future<Map<String, dynamic>> getNoticeList() async {

      //라우트 경로 지정
      Uri _uri = getApiBaseUri("notice");
      Get.log('<==== _uri : ' + _uri.toString());

      //API 호출
      var response = await httpClient.getUri(_uri, options: optionsCache);

      if (response.data['resultCode'] == 200) {
        final data = Map<String, dynamic>();
        data['noticeList'] = await response.data['data'].map<Notice>((obj) => Notice.fromJson(obj)).toList();
        data['noticeCnt'] = response.data['total'];
        return data;
      }
      else {
        return response.data['message'];
      }
  }

}







