import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HorizontalDivider extends StatelessWidget {
  final Color lineColor;
  HorizontalDivider({this.lineColor = Colors.grey});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 30.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            height: 1.0,
            width: Get.width,
            color: lineColor,
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
      ],
    );
  }
}
