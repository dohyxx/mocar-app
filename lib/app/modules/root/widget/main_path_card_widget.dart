import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/modules/root/controllers/root_controller.dart';

class MainPathCardWidget extends GetView<RootController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final String title;
  final String photo;

  MainPathCardWidget({
    Key key,
     this.title,
     this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Container(
          height: 106,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: Color(0xffE1E6EB),
            ),
          ),
          child: MaterialButton(
            onPressed: () async {
              //
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 8),

                Row(
                  children: [
                    Image.asset(
                      'assets/icon/${photo}',
                    ),

                    SizedBox(width: 3),

                    Text(
                      '${title}',
                      style: TextStyle(
                        color: Color(0xff00AC76),
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),

                Row(
                  children: [
                    Text(
                      '6월 상차지 3',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '3건 업로드 \n성공',
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                        fontSize: 14,

                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
