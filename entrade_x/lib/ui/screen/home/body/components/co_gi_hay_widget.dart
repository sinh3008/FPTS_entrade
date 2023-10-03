import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
SizedBox CoGiHayWidget(double width, double height) {
  return SizedBox(
    width: width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.02),
          child: const Text(
            'Có gì hay cho bạn? ',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        ItemCoGiHay(height, width,
            backIconColor: const Color(0xff3c2140),
            imgPath: 'assets/images/gift-box.png',
            imgPath2: 'assets/images/gift-box.png',
            imgPath3: 'assets/images/dollar.png',
            title: 'Quà tặng - Gift X',
            content1_1: '23,62 ',
            content1_2: 'Món quà đã được trao',
            content2_1: '9,452,415,766',
            content2_2: ' đã được gửi tặng',
            onTap: () {}),
        SizedBox(
          height: height * 0.01,
        ),
        ItemCoGiHay(height, width,
            backIconColor: const Color(0xff1e373e),
            imgPath: 'assets/images/cyber-security.png',
            imgPath2: 'assets/images/cyber-security.png',
            imgPath3: 'assets/images/dollar.png',
            title: 'Smart OTP',
            content1_1: '21,922 ',
            content1_2: 'KH đã sử dụng an toàn\n và bảo mật',
            content2_1: 'Miễn phí',
            content2_2: ' đăng ký',
            onTap: () {}),
        SizedBox(
          height: height * 0.01,
        ),
        ItemCoGiHay(height, width,
            backIconColor: const Color(0xff403521),
            imgPath: 'assets/images/mobile.png',
            imgPath2: 'assets/images/mobile.png',
            imgPath3: 'assets/images/dollar.png',
            title: 'Hướng dẫn giao dịch',
            content1_1: '80 ',
            content1_2: 'Hướng dẫn chi tiết',
            content2_1: '401',
            content2_2: ' người tìm được thông tin',
            onTap: () {}),
      ],
    ),
  );
}

// ignore: non_constant_identifier_names
Container ItemCoGiHay(
  double height,
  double width, {
  required String imgPath,
  required String imgPath2,
  required String imgPath3,
  required String title,
  required String content1_1,
  required String content1_2,
  required String content2_1,
  required String content2_2,
  required Color backIconColor,
  void Function()? onTap,
}) {
  return Container(
    padding: const EdgeInsets.all(12),
    color: const Color(0xff202123),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: backIconColor,
          ),
          child: Image(
            image: AssetImage(imgPath),
            width: 40,
            height: height * 0.12,
          ),
        ),
        SizedBox(
          width: width * 0.04,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              children: [
                Image(
                  image: AssetImage(imgPath2),
                  width: 16,
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                // Text(content1_1),
                AutoSizeText(
                  content1_1,
                  style: const TextStyle(fontSize: 14),
                  maxLines: 2,
                ),
                // Text(content1_2),
                AutoSizeText(
                  content1_2,
                  style: const TextStyle(fontSize: 14),
                  maxLines: 2,
                )
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              children: [
                Image(
                  image: AssetImage(imgPath3),
                  width: 16,
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                Text(content2_1),
                Text(content2_2),
              ],
            )
          ],
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: width * 0.14,
            alignment: Alignment.bottomRight,
            height: height * 0.12,
            child: const Icon(Icons.navigate_next),
          ),
        ),
      ],
    ),
  );
}
