import 'package:entrade_x/ui/components/circle_k.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../../../theme/constrants.dart';
import '../../../../other/strings.dart';
import '../../../../theme/size_config.dart';
import '../../../pages_test/order_page.dart';
import '../../../pages_test/search_page.dart';
import '../components/ideas/investment_ideas.dart';

AppBar buildAppBarHome(BuildContext context) {
  return AppBar(
    backgroundColor:
        Theme.of(context).appBarTheme.backgroundColor?.withOpacity(0.9),
    automaticallyImplyLeading: false,
    elevation: 1,
    toolbarHeight: getProportionateScreenHeight(80),
    // Set this height
    flexibleSpace: SafeArea(
      child: Container(
        padding: EdgeInsets.only(bottom: getProportionateScreenHeight(16)),
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight * 0.2,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
          // color: Color(0xff262626),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            sizeBoxWidth(16),
            Expanded(
              flex: 7,
              child: Container(
                width: SizeConfig.screenWidth * 0.7,
                height: getProportionateScreenHeight(40),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).appBarTheme.foregroundColor,
                    boxShadow: [boxShadowFight()]),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    sizeBoxWidth(10),
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
            sizeBoxWidth(8),
            Expanded(
              flex: 1,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const InvestmentIdeas();
                      },
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(0),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    width: getProportionateScreenWidth(40),
                    height: getProportionateScreenHeight(40),
                    decoration: BoxDecoration(
                        color: Theme.of(context).appBarTheme.foregroundColor,
                        shape: BoxShape.circle,
                        boxShadow: [boxShadowFight()]),
                    child: Image(
                      image: const AssetImage(sLightBulb),
                      fit: BoxFit.cover,
                      color: Colors.yellow.shade400,
                    ),
                  )),
            ),
            sizeBoxWidth(16),
          ],
        ),
      ),
    ),
  );
}
