import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/modules/delivery/controllers/delivery_controller.dart';

class AnimatedToggleWidget extends StatefulWidget {
  final List<String> values;
  final ValueChanged onToggleCallback;
  bool initialPosition;
  final Color backgroundColor;
  final Color buttonColor;
  final Color textColor;

  AnimatedToggleWidget({
    this.values,
    this.onToggleCallback,
    this.initialPosition,
    this.backgroundColor = const Color(0xFF00AC76),
    this.buttonColor = const Color(0xff00AC76),
    this.textColor = const Color(0xFF00AC76),
  });

  @override
  _AnimatedToggleState createState() => _AnimatedToggleState();
}

class _AnimatedToggleState extends State<AnimatedToggleWidget> {
  // bool initialPosition = true;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width * 0.15,
        height: Get.width * 0.08,
        margin: EdgeInsets.all(8),
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                widget.initialPosition = !widget.initialPosition;
                var index = 0;
                if (!widget.initialPosition) {
                  index = 1;
                }
                if(Get.find<DeliveryController>().deliveryDay.delSn != '')  widget.initialPosition = true;
                widget.onToggleCallback(index);
                setState(() {});
              },
              child: Container(
                width: Get.width * 0.5,
                height: Get.width * 0.1,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Get.width * 0.1),
                    side: BorderSide(
                      color: Color(0xff00AC76),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            AnimatedAlign(
              duration: const Duration(milliseconds: 125),
              curve: Curves.decelerate,
              alignment: widget.initialPosition
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Container(
                  width: Get.width * 0.05,
                  height: Get.width * 0.05,
                  decoration: ShapeDecoration(
                    color: Color(0xFF00AC76),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Get.width * 0.1),
                        side: BorderSide(color: Color(0xFF00AC76), width: 2)),
                  ),
                  //alignment: Alignment.center,
                ),
              ),
            ),
          ],
        ),
      );
  }
}
