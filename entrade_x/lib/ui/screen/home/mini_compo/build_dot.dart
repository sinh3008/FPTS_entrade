import 'package:flutter/material.dart';

import '../../../../../constrants.dart';

AnimatedContainer buildDot({
  int? index,
  required double width,
  double height = 2,
  Color color = Colors.lightGreen,
}) {
  return AnimatedContainer(
    duration: kAnimationDuration,
    margin: const EdgeInsets.only(right: 5),
    height: height,
    // width: currentPage == index ? 20 : 6,
    width: width,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(30),
    ),
  );
}
