import 'package:flutter/material.dart';

GestureDetector buildCircleK({
  required Widget demo,
  required Color color,
  double width = 50,
  Border? border,
  double height = 50,
  EdgeInsetsGeometry margin = const EdgeInsets.all(0),
  BorderRadiusGeometry? borderRadius,
  BoxShape shape = BoxShape.circle,
  required VoidCallback onClicked,
  EdgeInsetsGeometry padding =
      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
}) {
  return GestureDetector(
    onTap: onClicked,
    child: Container(
      margin: margin,
      // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: padding,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        border: border,
        shape: shape,
        borderRadius: borderRadius,
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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color, shape: shape, borderRadius: BorderRadius.circular(26)),
      child: demo,
    ),
  );
}
