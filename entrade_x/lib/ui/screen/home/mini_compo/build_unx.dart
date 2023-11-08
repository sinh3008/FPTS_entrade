import 'package:entrade_x/theme/size_config.dart';
import 'package:flutter/material.dart';

InkWell buildUnx({
  required double width,
  required Text txt1,
  required Text txt2,
  required Text txt3,
  required Text txt4,
   Color? color = Colors.white,
   Color? color2 = Colors.black,
  required bool isActive,
  void Function()? onTap,
  final int index = 0,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: getProportionateScreenHeight(100),
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(6), vertical: getProportionateScreenWidth(10)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          sizeBoxWidth(1),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: width * 0.23, child: txt1),
                SizedBox(width: width * 0.23, child: txt2),
                SizedBox(width: width * 0.23, child: txt3),
                SizedBox(width: width * 0.23, child: txt4),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
