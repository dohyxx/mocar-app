import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/modules/auth/controllers/auth_controller.dart';

class NoticeListWidget extends GetWidget<AuthController> {
  int index;
  ExpandableController expandableController = new ExpandableController();
  RxBool isExpanded = false.obs;

  final scaffoldKey = new GlobalKey<ScaffoldState>();

  NoticeListWidget({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
      child: Row(mainAxisSize: MainAxisSize.max, children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            width: MediaQuery.of(context).size.width,
            child: ExpandableNotifier(
              controller: expandableController,
              child: ExpandablePanel(
                header: InkWell(
                  onTap: (){
                    Get.log('<===== 전체공지 목록 click');
                    if(!expandableController.expanded) {
                      isExpanded.value = true;
                      expandableController.expanded = true;
                    }
                    else {
                      isExpanded.value = false;
                      expandableController.expanded = false;
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //ExpandablePanel header 내용 시작
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(() =>
                                        isExpanded.value == false ?
                                        Row(
                                        children: [
                                          Container(
                                            width: 4,
                                            height: 4,
                                            decoration: new BoxDecoration(
                                              color: Color(0xff333D4B),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 0),
                                              child: Text(
                                                '저렴한 화물배송 모카 서비스 정식 런칭 일정 안내 모카 서비스 정식 런칭 일정 안내',
                                                style: TextStyle(
                                                  color: Color(0xff333D4B),
                                                  fontSize: 14,
                                                  fontFamily: 'NotoSansKR',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 0),

                                          Expanded(
                                            flex: 0,
                                            child: Text(
                                              '2022.7.31',
                                              style: TextStyle(
                                                color: Color(0xff333D4B),
                                                fontSize: 12,
                                                fontFamily: 'NotoSansKR',
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            size: 20.0,
                                            color: Color(0x3d000000),
                                          )
                                        ],
                                      )
                                      : Row(
                                          children: [
                                            Container(
                                              width: 4,
                                              height: 4,
                                              decoration: new BoxDecoration(
                                                color: Color(0xff333D4B),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8, vertical: 0),
                                                child: Text(
                                                  '저렴한 화물배송 모카 서비스 정식 런칭 일정 안내\n모카 서비스 정식 런칭 일정 안내',
                                                  style: TextStyle(
                                                    color: Color(0xff333D4B),
                                                    fontSize: 14,
                                                    fontFamily: 'NotoSansKR',
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                    SizedBox(height: 8),

                                    Obx(()=>
                                    isExpanded.value == false
                                        ? Divider(
                                          color: Color(0xffE1E6EB),
                                          thickness: 1,
                                          )
                                        : SizedBox(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //ExpandablePanel header 내용 종료

                //펼친 내용 시작
                expanded: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        isExpanded.value = false;
                        expandableController.expanded = false;
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '2022.7.31',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff333D4B),
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_up,
                            size: 20.0,
                            color: Color(0xff009365),
                          ),
                          SizedBox(width: 16),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffF0F4FA),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 16, bottom: 35),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "물품 가격은 스마트스토어 상품을 불러올 때\n스마트스토어에 입력된 값을 수집합니다.\n\n1개의 가격이므로 택배 신청 과정에서 변경할 수 있어요.\n\n[물품 가격 저장]을 체크하면 상품 정보가 수정되고 앞으로 적어둔 가격으로 불러옵니다.\n\n물품 가격 허위 기재 시 배송 과정에서 불이익이 \n발생할 수 있으니 정확히 기재해야 합니다.\n물품 가격은 스마트스토어 상품을 불러올 때스마트스토어에 입력된 값을 수집합니다.\n\n1개의 가격이므로 택배 신청 과정에서 변경할 수 있어요.",
                                  // '${controller.boardList[index].boardContents}',
                                  softWrap: true,
                                  overflow: TextOverflow.clip,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color(0xff333D4B),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: 'NotoSansKR',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
                //펼친 내용 종료

                theme: ExpandableThemeData(
                  tapHeaderToExpand: true,
                  tapBodyToExpand: false,
                  tapBodyToCollapse: false,
                  hasIcon: false,
                  collapseIcon: Icons.arrow_drop_up,
                  expandIcon: Icons.arrow_drop_down,
                  iconColor: Color(0xffCCD6E6),
                  iconPadding: EdgeInsets.only(top: 0, right: 0),
                  iconSize: 20,
                  useInkWell: true,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
