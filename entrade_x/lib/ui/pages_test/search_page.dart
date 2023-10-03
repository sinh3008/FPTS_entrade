import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  static String routerName = 'inboxpage';

  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return WillPopScope(
      onWillPop: () async {
        FocusManager.instance.primaryFocus?.unfocus(); // Ẩn bàn phím
        return true; // Cho phép quay lại màn hình trước đó
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 100, // Set this height
          flexibleSpace: SafeArea(
            child: Container(
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
                            autofocus: true,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '   Tìm mã để đặt lệnh',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onTap: () {},
                            onChanged: (value) {
                              // Xử lý sự kiện khi người dùng thay đổi nội dung tìm kiếm
                            },
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.search),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Center(
          child: TextButton(child: const Text('Tìm kiếm'), onPressed: () {}),
        ),
      ),
    );
  }
}
