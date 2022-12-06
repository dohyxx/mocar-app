import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SubAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final String subTitle;
  final TabBar tabBar;

  const SubAppBarWidget({
    @required this.appBar,
    @required this.subTitle,
    this.tabBar,
    Key key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      leading: new IconButton(
        icon: new Icon(Icons.arrow_back_ios, color: Color(0xbb333D4B)),
        iconSize: 16,
        onPressed: () => {Get.back()},
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            this.subTitle,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 22,
              fontFamily: 'NotoSansKR',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      titleSpacing: -15,
      centerTitle: false,
      elevation: 0,
      bottom: this.tabBar,
      shape: tabBar != null ? Border(bottom: BorderSide(color: Color(0xffd6d6d6))) : null,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
