import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

GestureDetector buildCircleK({
  required Widget demo,
  required Color color,
  double width = 50,
  double height = 50,
  BoxShape shape = BoxShape.circle,
  required VoidCallback onClicked,
  EdgeInsetsGeometry padding =
      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
}) {
  return GestureDetector(
    onTap: onClicked,
    child: Container(
      // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: padding,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        shape: shape,
      ),
      child: demo,
    ),
  );
}

GestureDetector buildRecBorder({
  required Widget demo,
  required Color color,
  double width = 50,
  double height = 40,
  BoxShape shape = BoxShape.rectangle,
  void Function()? func,
  int index = 0,
}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
          color: color, shape: shape, borderRadius: BorderRadius.circular(26)),
      child: demo,
    ),
  );
}
