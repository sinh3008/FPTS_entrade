import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../constrants.dart';
import '../../../size_config.dart';
import '../../components/circle_k.dart';
import '../../screen/home/components/ideas/investment_ideas.dart';
import '../order_page.dart';
import '../search_page.dart';

AppBar buildAppBarFollows(BuildContext context, void Function()? onTap) {
  return AppBar(
    toolbarHeight: getProportionateScreenHeight(156), // Set this height
    flexibleSpace: SafeArea(
      child: Container(
        margin: EdgeInsets.zero,
        width: SizeConfig.screenWidth * 1,
        height: SizeConfig.screenHeight,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          color: Color(0xff1d1d1d),
          // color: Color(0xff262626),
        ),
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                const Icon(
                  Icons.arrow_back,
                ),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                Container(
                  width: SizeConfig.screenWidth * 0.68,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xff272729),
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
                          canRequestFocus: false,
                          autofocus: false,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '   Tìm mã để đặt lệnh',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          onTap: () {
                            PersistentNavBarNavigator
                                .pushNewScreenWithRouteSettings(
                              context,
                              settings: RouteSettings(name: Page2.routerName),
                              screen: const SearchPage(),
                              pageTransitionAnimation:
                                  PageTransitionAnimation.fade,
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
                  width: getProportionateScreenWidth(20),
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
                  width: getProportionateScreenWidth(5),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: getProportionateScreenWidth(10)),
                      child: Row(
                        children: [
                          const Text(
                            'BVH ',
                            style: TextStyle(fontSize: 18, color: kWhite),
                          ),
                          const Text(
                            'HOUSE ',
                            style: TextStyle(fontSize: 12, color: kGrey),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(10),
                          ),
                          buildCircleK(
                            padding: EdgeInsets.zero,
                            demo: const Icon(
                              Icons.camera_enhance_outlined,
                              size: 18,
                              color: Colors.grey,
                            ),
                            color: kGreyColorCustom,
                            width: getProportionateScreenWidth(34),
                            height: getProportionateScreenHeight(34),
                            onClicked: () {},
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(10),
                          ),
                          buildCircleK(
                            padding: EdgeInsets.zero,
                            demo: const Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.red,
                            ),
                            color: kGreyColorCustom,
                            width: getProportionateScreenWidth(34),
                            height: getProportionateScreenHeight(34),
                            onClicked: () {},
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          right: getProportionateScreenWidth(10)),
                      child: const Row(
                        children: [
                          Text(
                            '42.45 ',
                            style: TextStyle(color: Colors.green, fontSize: 18),
                          ),
                          Text(
                            '(0.20 0.48%)',
                            style: TextStyle(color: Colors.green, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: getProportionateScreenWidth(10)),
                      child: const Text('Tập đoàn bảo việt'),
                    ),
                    Row(
                      children: [
                        const Text(
                          '378.30 ',
                          style: TextStyle(color: kWhite),
                        ),
                        const Text('CP  '),
                        const Text(
                          '15.890 ',
                          style: TextStyle(color: kWhite),
                        ),
                        const Text('Tỷ'),
                        SizedBox(
                          width: getProportionateScreenWidth(10),
                        ),
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}
