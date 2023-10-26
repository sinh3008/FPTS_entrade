import 'package:entrade_x/strings.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../../../constrants.dart';
import '../../../../size_config.dart';
import '../../../components/circle_k.dart';
import '../../../pages_test/order_page.dart';
import '../../../pages_test/search_page.dart';
import '../../home/components/ideas/investment_ideas.dart';
<<<<<<< HEAD
=======


>>>>>>> origin/main

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
          color: kBgAppbarGrey,
          // color: Color(0xff262626),
        ),
        child: Column(
          children: [
            sbh(6),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_back, color: kRedButtonBG),
                  Container(
                    width: SizeConfig.screenWidth * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: kBgBoxSearch,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        sbw(10),
                        Image(
                          image: const AssetImage(sReadyStock),
                          fit: BoxFit.cover,
                          width: getProportionateScreenWidth(26),
                          height: getProportionateScreenHeight(26),
                          color: kRedButtonBG,
                        ),
                        Expanded(
                          child: TextField(
                            canRequestFocus: false,
                            autofocus: false,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: sSearchCoin,
                              hintStyle: kTextGrey15Normal,
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
                      width: getProportionateScreenWidth(45),
                      height: getProportionateScreenHeight(45),
                      onClicked: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const InvestmentIdeas();
                          },
                        ));
                      },
                      demo: Image(
                        image: const AssetImage(sLightBulb),
                        fit: BoxFit.cover,
                        color: Colors.yellow.shade400,
                      ),
                      color: kBgBoxSearch),
                ],
              ),
            ),
            sbh(10),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(16)),
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
                            style: kTextGrey13Normal,
                            textAlign: TextAlign.justify,
                          ),
                          sbw(6),
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
                          sbw(6),
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
                            style: kTextGreen20Bold,
                          ),
                          Text(
                            '(0.20 0.48%)',
                            style: kTextGreen15Normal,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: getProportionateScreenHeight(6)),
                        child: const Text(
                          'Tập đoàn Bảo Việt',
                          style: kTextGrey14Normal,
                        ),
                      ),
                      const Row(
                        children: [
                          Text(
                            '378.30 ',
                            style: kTextWhite15Normal,
                          ),
                          Text(
                            'CP  ',
                            style: kTextGrey14Normal,
                          ),
                          Text(
                            '15.890 ',
                            style: kTextWhite15Normal,
                          ),
                          Text('Tỷ', style: kTextGrey14Normal,),
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
