import 'package:entrade_x/size_config.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../../../constrants.dart';
import '../../../../strings.dart';
import '../../../components/circle_k.dart';
import '../../../pages_test/order_page.dart';
import '../../../pages_test/search_page.dart';
import '../components/ideas/investment_ideas.dart';

AppBar buildAppBarHome(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    toolbarHeight: getProportionateScreenHeight(80), // Set this height
    flexibleSpace: SafeArea(
      child: Container(
        padding: EdgeInsets.only(bottom: getProportionateScreenHeight(16)),
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight * 0.2,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
          color: kBgBoxSearch.withOpacity(0.4),
          // color: Color(0xff262626),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            sbw(16),
            Expanded(
              child: Container(
                width: SizeConfig.screenWidth * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: kBgBoxSearch,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
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
            ),
            sbw(8),
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
            sbw(16),
          ],
        ),
      ),
    ),
  );
}
