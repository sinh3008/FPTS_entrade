import 'package:flutter/material.dart';

Container buildTextDemo(
    {required double width, required String title, required String money}) {
  return Container(
    margin: const EdgeInsets.only(right: 5),
    width: width * 0.3,
    child: Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
        ),
        Text(
          money,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
        ),
      ],
    ),
  );
}
