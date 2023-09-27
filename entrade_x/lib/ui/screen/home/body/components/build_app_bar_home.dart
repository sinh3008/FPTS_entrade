import 'package:flutter/material.dart';

import '../../../../components/circle_k.dart';
AppBar buildAppBarHome(double width, double height) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    toolbarHeight: 100, // Set this height
    flexibleSpace: SafeArea(
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        width: width,
        height: height * 0.2,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          color: Color(0xff262626),
          // color: Color(0xff262626),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: width * 0.02,
            ),
            Container(
              width: width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xff2c2d2f),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Image(
                    image: AssetImage('assets/images/ready_stock.png'),
                    fit: BoxFit.cover,
                    width: 30,
                    height: 30,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '   Tìm mã để đặt lệnh',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      onChanged: (value) {
                        // Xử lý sự kiện khi người dùng thay đổi nội dung tìm kiếm
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    color: Colors.white,
                    onPressed: () {
                      // Xử lý sự kiện tìm kiếm ở cuối
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: width * 0.02,
            ),
            buildCircleK(
                onClicked: (){},
                demo: const Image(
                  image: AssetImage('assets/images/lightbulb.png'),
                  fit: BoxFit.cover,
                ),
                color: const Color(0xff2c2d2f)),
            SizedBox(
              width: width * 0.02,
            ),
          ],
        ),
      ),
    ),
  );
}
