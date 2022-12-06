import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/flutter_flow/flutter_flow_util.dart';
import 'package:mocar_test/app/flutter_flow/flutter_flow_widgets.dart';

class Util {
  /**
   * 알림창
   */
  static void alert(String content,
      {String title = "알림",
      String okButtonName = "확인",
      double size = 16,
      Function callback})
  {
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Flexible(
                child: Text(
                  content,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: Color(0xdd000000),
                    fontSize: size,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ]),
            SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                    child: FFButtonWidget(
                  onPressed: () async {
                    await Get.back();
                    if (callback != null) {
                      await callback();
                    }
                  },
                  text: okButtonName,
                  options: FFButtonOptions(
                    height: 39,
                    color: Color(0xff00B1A7),
                    elevation: 0,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w500,
                    ),
                    // borderSide: BorderSide(
                    //   color: Colors.black,
                    //   width: 1,
                    // ),
                    borderRadius: 8,
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  /**
   * 확인창
   */
  static void confirm(String content,
      {String okButtonName = "확인",
      String cancelButtonName = "취소",
      Function callback,
      Function cancelCallback}) {
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(children: [
              Flexible(
                child: Text(
                  content,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: Color(0xdd000000),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ]),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    height: 42,
                    color: Color(0xff00a59d),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        // side: BorderSide(
                        //   color: Colors.black,
                        //   width: 1,
                        // ),
                        borderRadius: BorderRadius.circular(12)),
                    onPressed: () async {
                      await Get.back();
                      if (callback != null) {
                        await callback();
                      }
                    },
                    child: Text(
                      '${okButtonName}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: MaterialButton(
                    height: 42,
                    color: Colors.white,
                    elevation: 0,
                    onPressed: () async {
                      await Get.back();
                      if (cancelCallback != null) {
                        await cancelCallback();
                      }
                    },
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      '${cancelButtonName}',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  /**
   * 드롭다운 박스
   */
  static Container dropdownButton<T>(
      Rx<String> hintText,
      final List<DropdownMenuItem<T>> dropdownMenuItems,
      Function onChangeCallback) {
    return Container(
      height: 34,
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Color(0xddF5F7FA),
        border: Border.all(width: 1, color: Color(0xffd6d6d6)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton<T>(
        isExpanded: true,
        hint: Text(hintText.value),
        underline: Container(
          height: 1,
          color: Color(0xddE8EDF3),
        ),
        icon: Icon(Icons.arrow_drop_down, size: 25),
        items: dropdownMenuItems,
        onChanged: (value) {
          if (onChangeCallback != null) {
            onChangeCallback(value);
          }
        },
        style: TextStyle(
          color: Color(0xff9b9b9b),
          fontSize: 12,
          fontFamily: 'NotoSansKR',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /**
   * 월별정산 리스트 상세 팝업창
   */
  static listDetailAlert() {
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'ABCDE00005014654',
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 13,
                                            fontFamily: 'NotoSansKR',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Icon(
                                            Icons.close,
                                            color: Color(0xff333D4B),
                                            size: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          '운송일',
                                          style: TextStyle(
                                            color: Color(0xFF333D4B),
                                            fontSize: 12,
                                            fontFamily: 'NotoSansKR',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          '|',
                                          style: TextStyle(
                                            color: Color(0xFFE1E6EB),
                                            fontSize: 12,
                                            fontFamily: 'NotoSansKR',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          '2022.03.10 18:00',
                                          style: TextStyle(
                                            color: Color(0xFF333D4B),
                                            fontSize: 12,
                                            fontFamily: 'NotoSansKR',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 14),

                                    Row(
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                'assets/icon/point.png',
                                              ),

                                              SizedBox(width: 2),

                                              Text(
                                                '상차지 1',
                                                style: TextStyle(
                                                  fontFamily: 'Noto Sans',
                                                  fontSize: 12,
                                                  color: Color(0xFF00AC76),
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: Row(
                                            children: [
                                              Text(
                                                '셀프스토리지 인천센터',
                                                style: TextStyle(
                                                  fontFamily: 'Noto Sans',
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 14),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Color(0xffE1E6EB),
                                            ),
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 14,
                                                  vertical: 3),
                                              child: Text(
                                                '도로명',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11,
                                                  fontFamily: 'NotoSansKR',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 12),

                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 4),
                                            child: Text(
                                              '인천 서구 원전로 54 7번 게이트',
                                              style: TextStyle(
                                                color: Color(0xff333D4B),
                                                fontSize: 14,
                                                fontFamily: 'NotoSansKR',
                                                fontWeight: FontWeight.w500,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),

                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Color(0xffE1E6EB),
                                            ),
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 19,
                                                  vertical: 3),
                                              child: Text(
                                                '지번',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11,
                                                  fontFamily: 'NotoSansKR',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 4),
                                            child: Text(
                                              '경서동 693-5',
                                              style: TextStyle(
                                                color: Color(0xff333D4B),
                                                fontSize: 14,
                                                fontFamily: 'NotoSansKR',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 14),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/icon/clock.png',
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          '상차 14:30',
                                          style: TextStyle(
                                            fontFamily: 'Noto Sans',
                                            fontSize: 13,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          '|',
                                          style: TextStyle(
                                            fontFamily: 'Noto Sans',
                                            fontSize: 13,
                                            color: Color(0xffE1E6EB),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          '파레트 KPP / 5개',
                                          style: TextStyle(
                                            fontFamily: 'Noto Sans',
                                            fontSize: 13,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: Color(0xffE1E6EB),
                                                  width: 1),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 6, horizontal: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '상차 도움',
                                                    style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 13,
                                                      fontFamily:
                                                          'NotoSansKR',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  Text(
                                                    '추가 운임 6,000원',
                                                    style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 13,
                                                      fontFamily:
                                                          'NotoSansKR',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFF65707E),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 6, horizontal: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    '배송 총 운임 66,000원',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13,
                                                      fontFamily:
                                                          'NotoSansKR',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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
          ],
        ),
      ),
    ));
  }

  /**
   * 요일이름 반환
   */
  static String weekdayName(int weekday, {bool isFull = true}) {
    String name = '';
    String dayWeek = isFull ? '요일' : '';
    switch (weekday) {
      case 1:
        name = '월$dayWeek';
        break;
      case 2:
        name = '화$dayWeek';
        break;
      case 3:
        name = '수$dayWeek';
        break;
      case 4:
        name = '목$dayWeek';
        break;
      case 5:
        name = '금$dayWeek';
        break;
      case 6:
        name = '토$dayWeek';
        break;
      case 7:
        name = '일$dayWeek';
        break;
    }

    return name;
  }

  /**
   * 등록된 길이에 맞게 왼쪽에 문자를 채워 반환 처리
   */
  static String padLeft(dynamic value, {String fillStr = '0', int length = 2}) {
    if (value == null) {
      return ''.padLeft(length, fillStr);
    } else {
      return value.toString().padLeft(length, fillStr);
    }
  }

  /**
   * 일자와 요일을 반환
   */
  static String dayWeek(String selectDate) {
    if (selectDate.isNotEmpty && selectDate.length == 10) {
      var date = new DateFormat("yyyy-MM-dd").parse(selectDate);
      return Util.padLeft(date.month) +
          '월' +
          Util.padLeft(date.day) +
          '일 ' +
          '(' +
          Util.weekdayName(date.weekday, isFull: false) +
          ')';
    } else {
      return '';
    }
  }



  /**
   * 날짜 형식 변환
   */
  static String dateForm (DateTime date, {int type=0}) {
    if (date == null) {
      return '-';
    } else {
      if (type == 0) {
        return new DateFormat('yyyy/MM/dd').format(date);
      } else if (type == 1) {
        return new DateFormat('yyyy.MM.dd').format(date);
      } else if (type == 2) {
        return new DateFormat('yyyy-MM-dd').format(date);
      } else if (type == 3) {
        return new DateFormat('yy/MM/dd E', 'ko').format(date);
      } else if (type == 4) {
        return new DateFormat('yy/MM/dd HH:mm').format(date);
      } else if (type == 5) {
        return new DateFormat('yy/MM/dd (E) HH:mm', 'ko').format(date);
      } else if (type == 6) {
        return new DateFormat('HH:mm', 'ko').format(date);
      } else if (type == 7) {
        return new DateFormat('yy/MM/dd (E) a hh:mm', 'ko').format(date);
      } else if (type == 8) {
        return new DateFormat('yy/MM/dd hh:mm:ss', 'ko').format(date);
      }
    }
  }


  /**
   * 숫자 천단위마다 콤마 처리
   */
  static String numberWithComma(dynamic number, {bool isDecimal=true}){
    if(number != null){
      if(isDecimal){
        return NumberFormat('###,###,###,##0.000').format(number).replaceAll(' ', '');
      }else{
        return NumberFormat('###,###,###,##0').format(number).replaceAll(' ', '');
      }
    }else{
      return '0';
    }
  }

  static void print(dynamic message) {
    try {
      Get.log(
          '[${DateFormat.Hms().format(DateTime.now())}] <======= ${message}');
    } catch (e) {
      print(message.toString());
    }
  }
}
