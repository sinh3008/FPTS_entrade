import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../../../theme/constrants.dart';
import '../../../../other/strings.dart';
import '../../../../theme/size_config.dart';
import '../../../components/circle_k.dart';
import '../../../pages_test/order_page.dart';
import '../../../pages_test/search_page.dart';
import '../../home/components/ideas/investment_ideas.dart';

AppBar appBar(BuildContext context) {
  return AppBar(
    toolbarHeight: getProportionateScreenHeight(140), // Set this height
    flexibleSpace: SafeArea(
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
        margin: EdgeInsets.zero,
        width: SizeConfig.screenWidth * 1,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
          color: Theme.of(context).appBarTheme.foregroundColor,
          // color: Color(0xff262626),
        ),
        child: Column(
          children: [
            sizeBoxHeight(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
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
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const InvestmentIdeas();
                        },
                      ));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
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
              ],
            ),
            sizeBoxHeight(18),
            Row(
              children: [
                buildCircleK(
                  width: getProportionateScreenWidth(45),
                  height: getProportionateScreenHeight(45),
                  border: Border.all(width: 1, color: kRedButtonBG),
                  demo: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      image: const DecorationImage(
                        image: AssetImage(sIconUser),
                        fit: BoxFit.cover
                      ),
                    ),
                  ),
                  color: Theme.of(context).colorScheme.background,
                  onClicked: () {},
                ),
                sizeBoxWidth(15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sNameUser,
                      style: kText15Normal.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                    sizeBoxHeight(8),
                    const Text(
                      sCodeUser,
                      style: kTextGrey15Normal,
                    ),
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
