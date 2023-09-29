import 'package:flutter/material.dart';

import '../body_home.dart';

AnimatedContainer buildDot(
    {int? index,
      required double width,
      required double height,
      Color color = Colors.lightGreen}) {
  return AnimatedContainer(
    duration: kAnimationDuration,
    margin: const EdgeInsets.only(right: 5),
    height: 10,
    // width: currentPage == index ? 20 : 6,
    width: width,
    decoration: BoxDecoration(
      // color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
      color: color,
      borderRadius: BorderRadius.circular(30),
    ),
  );
}