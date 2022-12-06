import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/common/util.dart';
import 'package:mocar_test/app/models/notice_model.dart';
import 'package:mocar_test/app/repositories/board_repository.dart';
import 'package:mocar_test/app/services/driver_work_service.dart';

class BoardController extends GetxController with GetSingleTickerProviderStateMixin {

  ScrollController scrollController;
  BoardRepository boardRepository;
  var noticeList = <Notice>[].obs;


  BoardController() {
    scrollController = new ScrollController();
    boardRepository = BoardRepository();
  }

  @override
  void onInit() async {
    super.onInit();
    await onRefresh();
  }

  onRefresh() async {
    await getNoticeList();
  }

  /**
   * 공지사항 조회
   */
  void getNoticeList() async{
    try{
      noticeList.clear();
      Map<String, dynamic> data = await Get.find<DriverWorkService>().getNoticeList();

      Get.log('<========= 공지사항 조회:' + data.toString());
      noticeList.addAll(data['noticeList']);

    } catch(e) {
      Util.print(e);
    }
  }

}