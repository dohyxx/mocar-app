import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/common/util.dart';
import 'package:mocar_test/app/modules/conveyance/controllers/conveyance_photo_controller.dart';
import 'package:mocar_test/app/modules/conveyance/widgets/completed_photo_list_widget.dart';
import 'package:mocar_test/app/modules/global_widgets/circular_loading_widget.dart';
import 'package:mocar_test/app/modules/global_widgets/empty_row.dart';
import 'package:mocar_test/app/modules/global_widgets/sub_app_bar_widget.dart';
import 'package:mocar_test/app/routes/app_routes.dart';

class CompletedPhotoView extends GetView<ConveyancePhotoController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,

      //App bar 시작
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: SubAppBarWidget(appBar: AppBar(), subTitle: '완료사진'),
      ),
      //App bar 종료

      body: SafeArea(
        child: RefreshIndicator(
          key: refreshKey,
          onRefresh: () async {
            refreshKey.currentState.show(atTop: true);
            controller.onRefresh(); // 새로고침
            return null;
          },
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(mainAxisSize: MainAxisSize.max, children: [
                  //상단 설명 container 시작
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                          child: Text(
                        '배송 완료를 위해 완료 사진을 첨부해주세요.',
                        softWrap: true,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: Color(0xff838C97),
                          fontFamily: 'NotoSansKR',
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                      )),
                    ],
                  ),

                  SizedBox(height: 16),

                  //완료사진 리스트 위젯 시작

                  Obx((){
                    if (controller.isContentLoading.isTrue){
                      return Center(
                          heightFactor: 5,
                          child: new CircularLoadingWidget(height: 90));
                    }
                    else if(controller.deliveryDetail.length > 0){
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          controller: controller.scrollController,
                          itemCount: controller.deliveryDetail.length,
                          itemBuilder: (context, index) {
                            return CompletedPhotoListWidget(index: index);
                          });
                    }else {
                      return EmptyRowWidget();
                    }
                  }),
                  //완료사진 리스트 위젯 종료

                  Divider(
                    color: Color(0xffE1E6EB),
                    thickness: 1,
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          '운송 완료 처리하시겠습니까?',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            await controller.registerPhoto();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff00B1A7),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  '운송 완료 처리하기',
                                  style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontSize: 17,
                                    fontFamily: 'NotoSansKR',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 27),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
