import 'package:flutter/material.dart';
Container buildUnx(
    {required double width,
      required String txt1,
      required String txt2,
      required String txt3,
      required String txt4,
      required bool isActive}) {
  return Container(
    width: width * 0.3,
    padding: const EdgeInsets.only(left: 10, top: 12, bottom: 12, right: 6),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      // color: const Color(0xff202123),
      color: isActive ? const Color(0xff54534c) : const Color(0xff202123),
    ),
    child: Row(

      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: isActive ? Colors.red : const Color(0xff202123),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        const SizedBox(
          width: 1,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              txt1.toUpperCase(),
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            Text(
              txt2.toUpperCase(),
              style: const TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              txt3,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            Text(
              txt4,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
