import 'package:flutter/material.dart';

class EmptyRowWidget extends StatelessWidget {
  final String title;
  final double height;

  EmptyRowWidget({this.title='리스트 내역 없음', this.height=200});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icon/ico_2_notice_red.png',
            height: 35,
          ),
          SizedBox(height: 10),
          Text(title,
            style: TextStyle(
              color: Color(0xff9b9b9b),
              fontSize: 16,
              fontFamily: 'NotoSansKR',
            ),
          ),
        ]
      )
    );
  }
}
