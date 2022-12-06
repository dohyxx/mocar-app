import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/common/util.dart';
import 'package:mocar_test/app/flutter_flow/flutter_flow_theme.dart';
import 'package:mocar_test/app/modules/auth/controllers/auth_controller.dart';
import 'package:mocar_test/app/modules/delivery/controllers/delivery_controller.dart';
import 'package:mocar_test/app/modules/delivery/widgets/delivery_path_bottom_widget.dart';
import 'package:mocar_test/app/modules/global_widgets/circular_loading_widget.dart';
import 'package:mocar_test/app/modules/global_widgets/sub_app_bar_widget.dart';
import 'package:mocar_test/app/services/settings_service.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DeliveryPathView extends GetView<DeliveryController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  PageController pageViewController = PageController(initialPage: 0);
  final popupHeight = 100.obs;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // resizeToAvoidBottomInset: false,
      appBar: SubAppBarWidget(appBar: AppBar(), subTitle: '배송경로'),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(bottom: (popupHeight.value-25)*0.01),
          height: MediaQuery.of(context).size.height,
          child:
          Obx(() {
            if(controller.isContentLoading.isTrue){
              return new CircularLoadingWidget(height: 90);
            }else{
              return Stack(
                children: [
                  Positioned(
                    child: Container(
                      child: WebView(
                        javascriptMode: JavascriptMode.unrestricted,
                        debuggingEnabled: true,
                        onWebViewCreated: (_con) {
                          controller.webView = _con;
                          Map<String, String> headers = {"authorization": 'Bearer ${Get.find<AuthController>().user.value.jwtToken}'};
                          controller.webView.loadUrl(Get.find<SettingsService>().routeMap + '${controller.deliveryList.first.delSn}', headers: headers);
                        },

                        onPageStarted: (String url) {
                          //
                        },

                        onPageFinished: (String url) async {
                          //
                        }
                      ),
                    ),
                  ),

                  Positioned(
                    child: new ClipRect(
                      child: new BackdropFilter(
                        filter: new ImageFilter.blur(),
                        child: new Container(
                          alignment: Alignment.topLeft,
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(22.0),
                                child: Image.asset('assets/icon/logo.png'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  IgnorePointer(
                    ignoring: true,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 30),
                      child: Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: PageView.builder(
                          allowImplicitScrolling: false,
                          pageSnapping: true,
                          controller: pageViewController,
                          physics: new AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.deliveryList[0].deliveryDetail.length ?? 0,
                          itemBuilder:(BuildContext context, int index) {
                            return DeliveryPathBottomWidget(index: index);
                          },
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Align(
                      alignment: AlignmentDirectional(0, 1),
                      child: SmoothPageIndicator(
                        controller: pageViewController ??= PageController(initialPage: 0),
                        count: controller.deliveryList[0].deliveryDetail.length ?? 0,
                        axisDirection: Axis.horizontal,
                        onDotClicked: (i) {
                          pageViewController.animateToPage(i,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        effect: ExpandingDotsEffect(
                          expansionFactor: 2,
                          spacing: 8,
                          radius: 16,
                          dotWidth: 6,
                          dotHeight: 6,
                          dotColor: FlutterFlowTheme.of(context).primaryBackground,
                          activeDotColor: Color(0xff00AC76),
                          paintStyle: PaintingStyle.fill,
                        ),
                      ),
                    ),
                  )
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}