import 'package:flutter/material.dart';

import '../../../../components/circle_k.dart';

Container buildEventContainer(
    {required String txt1,
    required String txt2,
    required String txt3,
    String iconPath = 'assets/images/ready_stock.png'}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: const Color(0xff262626),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              txt1,
              style: const TextStyle(color: Colors.grey),
            ),
            Text(
              txt2.toUpperCase(),
              style: const TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              txt3,
              style: const TextStyle(
                color: Colors.grey,

              ),
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        buildCircleK(
          onClicked: () {},
          demo: Image(
            image: AssetImage(iconPath),
          ),
          color: Colors.white,
        ),
      ],
    ),
  );
}
