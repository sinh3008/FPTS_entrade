// TODO Implement this library.
import 'package:entrade_x/ui/screen/home/body/body_home.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../components/circle_k.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('Go to page 2'),
          onPressed: () {
            PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
              context,
              settings: RouteSettings(name: Page2.routerName),
              screen: const Page2(),
              withNavBar: true,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  static String routerName = 'inboxpage';

  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios_sharp),
              onPressed: () {
                FocusScope.of(context).unfocus();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const BodyHome();
                    },
                  ),
                  (_) => false,
                );
              },
              // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: width * 0.02,
                ),
                Container(
                  width: width * 0.64,
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
                SizedBox(
                  width: width * 0.02,
                ),
                buildCircleK(
                    onClicked: () {},
                    demo: const Image(
                      image: AssetImage('assets/images/lightbulb.png'),
                      fit: BoxFit.cover,
                    ),
                    color: const Color(0xff2c2d2f)),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: TextButton(
            child: Text('Page 2'),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const AddPage();
                  },
                ),
                (_) => false,
              );
            }),
      ),
    );
  }
}
