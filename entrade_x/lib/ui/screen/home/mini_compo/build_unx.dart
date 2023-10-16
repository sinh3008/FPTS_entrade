import 'package:flutter/material.dart';

InkWell buildUnx({
  required double width,
  required Text txt1,
  required Text txt2,
  required Text txt3,
  required Text txt4,
  required Color color,
  required Color color2,
  required bool isActive,
  void Function()? onTap,
  final int index = 0,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: width * 0.3,
      padding: const EdgeInsets.only(left: 10, top: 12, bottom: 12, right: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // color: const Color(0xff202123),
          // color: isActive ? const Color(0xff54534c) : const Color(0xff202123),
          color: color2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              // color: isActive ? Colors.red : const Color(0xff202123),
              color: color,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          const SizedBox(
            width: 1,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: width * 0.23, child: txt1),
              SizedBox(width: width * 0.23, child: txt2),
              SizedBox(width: width * 0.23, child: txt3),
              SizedBox(width: width * 0.23, child: txt4),
            ],
          ),
        ],
      ),
    ),
  );
}
