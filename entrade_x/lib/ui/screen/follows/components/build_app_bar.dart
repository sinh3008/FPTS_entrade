import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../../../constrants.dart';
import '../../../../size_config.dart';
import '../../../components/circle_k.dart';
import '../../../pages_test/order_page.dart';
import '../../../pages_test/search_page.dart';
import '../../home/components/ideas/investment_ideas.dart';



AppBar buildAppBarFollows(BuildContext context, void Function()? onTap) {
  return AppBar(
    toolbarHeight: getProportionateScreenHeight(120), // Set this height
    flexibleSpace: SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        margin: EdgeInsets.zero,
        width: SizeConfig.screenWidth * 1,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
          color: Color(0xff1d1d1d),
          // color: Color(0xff262626),
        ),
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(6),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_back, color: Color(0xffd34343)),

                  Container(
                    width: SizeConfig.screenWidth * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xff272729),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: getProportionateScreenWidth(10),
                        ),
                        const Image(
                          image: AssetImage('assets/images/ready_stock.png'),
                          fit: BoxFit.cover,
                          width: 26,
                          height: 26,
                          color: Color(0xffd34343),
                        ),
                        Expanded(
                          child: TextField(
                            canRequestFocus: false,
                            autofocus: false,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '   Tìm mã để đặt lệnh',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            onTap: () {
                              pushNewScreenWithRouteSettings(
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
                          color: kGrey,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),

                  buildCircleK(
                      width: 46,
                      height: 46,
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
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'BVH ',
                            style: kTextWhite20Bold,
                          ),
                          const Text(
                            'HOUSE ',
                            style: TextStyle(color: kGrey, fontSize: 13),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(6),
                          ),
                          buildCircleK(
                            padding: EdgeInsets.zero,
                            demo: const Icon(
                              Icons.camera_enhance_outlined,
                              size: 16,
                              color: Colors.grey,
                            ),
                            color: kGreyColorCustom,
                            width: getProportionateScreenWidth(30),
                            height: getProportionateScreenHeight(30),
                            onClicked: () {},
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(6),
                          ),
                          buildCircleK(
                            padding: EdgeInsets.zero,
                            demo: const Icon(
                              Icons.add,
                              size: 16,
                              color: Color(0xffd34343),
                            ),
                            color: kGreyColorCustom,
                            width: getProportionateScreenWidth(30),
                            height: getProportionateScreenHeight(30),
                            onClicked: () {},
                          )
                        ],
                      ),
                      const Row(
                        children: [
                          Text(
                            '42.45 ',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '(0.20 0.48%)',
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: getProportionateScreenHeight(6)),
                        child: const Text(
                          'Tập đoàn Bảo Việt',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                      const Row(
                        children: [
                          Text(
                            '378.30 ',
                            style: TextStyle(
                                color: kWhite, fontWeight: FontWeight.w400),
                          ),
                          Text('CP  '),
                          Text(
                            '15.890 ',
                            style: TextStyle(
                                color: kWhite, fontWeight: FontWeight.w400),
                          ),
                          Text('Tỷ'),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
