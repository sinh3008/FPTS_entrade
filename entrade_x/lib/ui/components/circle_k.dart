import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

GestureDetector buildCircleK({required Widget demo,
  required Color color,
  double width = 50,
  double height = 50,
  BoxShape shape = BoxShape.circle,
  required VoidCallback onClicked,
}) {
  return GestureDetector(
    onTap: onClicked,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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

GestureDetector buildRecBorder({required Widget demo,
  required Color color,
  double width = 60,
  double height = 50,
  BoxShape shape = BoxShape.rectangle,
}) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        color: color,
        shape: shape,
        borderRadius: BorderRadius.circular(26)
      ),
      child: demo,
    ),
  );
}

