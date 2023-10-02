import 'package:entrade_x/ui/screen/home/body/components/investment_ideas.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../components/circle_k.dart';
import '../../../../pages_test/order_page.dart';
import '../../../../pages_test/search_page.dart';

AppBar buildAppBarHome(double width, double height, BuildContext context) {
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
                      autofocus: false,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '   Tìm mã để đặt lệnh',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      onTap: () {
                        PersistentNavBarNavigator
                            .pushNewScreenWithRouteSettings(
                          context,
                          settings: RouteSettings(name: Page2.routerName),
                          screen: const SearchPage(),
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
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
                onClicked: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const InvestmentIdeas();
                    },
                  ));
                },
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
