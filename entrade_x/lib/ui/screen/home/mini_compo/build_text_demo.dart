import 'package:flutter/material.dart';

Container buildTextDemo({
  required double width,
  required String title,
  required String money,
  Color colors = const Color(0xFF757575),
}) {
  return Container(
    margin: const EdgeInsets.only(right: 5),
    width: width * 0.2,
    child: Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 15, color: colors),
        ),
        Text(
          money,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.normal, fontSize: 14, color: colors),
        ),
      ],
    ),
  );
}
