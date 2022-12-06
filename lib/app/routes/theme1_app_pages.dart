import 'package:get/get.dart' show GetPage;
import 'package:mocar_test/app/modules/alarm/bindings/alarm_binding.dart';
import 'package:mocar_test/app/modules/alarm/views/alarm_list_view.dart';
import 'package:mocar_test/app/modules/conveyance/bindings/conveyance_binding.dart';
import 'package:mocar_test/app/modules/conveyance/views/completed_photo_view.dart';
import 'package:mocar_test/app/modules/cost/bindings/cost_binding.dart';
import 'package:mocar_test/app/modules/cost/views/cost_list_view.dart';
import 'package:mocar_test/app/modules/customer_support/bindings/customer_support_binding.dart';
import 'package:mocar_test/app/modules/delivery/views/delivery_stat_view.dart';
import 'package:mocar_test/app/modules/auth/views/mocar_login_view3.dart';
import 'package:mocar_test/app/modules/intro/views/intro_view.dart';
import 'package:mocar_test/app/modules/root/bindings/root_binding.dart';
import 'package:mocar_test/app/modules/root/views/main_view.dart';
import 'package:mocar_test/app/modules/root/views/whole_path_view.dart';
import 'package:mocar_test/app/modules/auth/views/mocar_login_view.dart';
import 'package:mocar_test/app/modules/auth/views/mocar_login_view2.dart';
import 'package:mocar_test/app/modules/auth/views/notice_list_view.dart';
import 'package:mocar_test/app/modules/delivery/bindings/delivery_binding.dart';
import 'package:mocar_test/app/modules/delivery/views/delivery_path_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import 'app_routes.dart';

class Theme1AppPages {
  static const INITIAL = Routes.INTRO;

  static final routes = [
    GetPage(name: Routes.INTRO, page: () => IntroView()),

    //로그인 화면
    GetPage(name: Routes.LOGINVIEW, page: () => MocarLoginView(), binding: AuthBinding()),
    GetPage(name: Routes.LOGINVIEW2, page: () => MocarLoginView2(), binding: AuthBinding()),
    GetPage(name: Routes.LOGINVIEW3, page: () => MocarLoginView3(), binding: AuthBinding()),

    //메인
    GetPage(name: Routes.MAINVIEW, page: () => MainView(), binding: RootBinding()),

    //배송
    GetPage(name: Routes.DELIVERYSTAT, page: () => DeliveryStatView(), binding: DeliveryBinding()),
    GetPage(name: Routes.DELIVERYROUTE, page: () => DeliveryPathView(), binding: DeliveryBinding()),

    //알람
    GetPage(name: Routes.ALARMLIST, page: () => AlarmListView(), binding: AlarmBinding()),

    //월별정산
    GetPage(name: Routes.COSTLIST, page: () => CostListView(), binding: CostBinding()),

    //공지
    GetPage(name: Routes.NOTICELIST, page: () => NoticeListView(), binding: CustomerSupportBinding()),

    //완료사진
    GetPage(name: Routes.COMPLETEDPHOTO, page: () => CompletedPhotoView(), binding: ConveyanceBinding()),

    //전체경로
    GetPage(name: Routes.WHOLEPATH, page: () => WholePathView(), binding: RootBinding()),
  ];
}
