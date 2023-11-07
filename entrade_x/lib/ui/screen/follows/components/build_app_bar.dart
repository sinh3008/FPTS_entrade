import 'package:entrade_x/other/strings.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../../../theme/app_colors.dart';
import '../../../../theme/constrants.dart';
import '../../../../theme/size_config.dart';
import '../../../components/circle_k.dart';
import '../../../pages_test/order_page.dart';
import '../../../pages_test/search_page.dart';
import '../../home/components/ideas/investment_ideas.dart';

AppBar buildAppBarFollows(
    BuildContext context, void Function()? onTap, double price) {
  return AppBar(
    toolbarHeight: getProportionateScreenHeight(120),
    backgroundColor: Theme.of(context)
        .appBarTheme
        .backgroundColor
        ?.withOpacity(0.9), // Set this height
    flexibleSpace: SafeArea(
      child: Container(
        height: getProportionateScreenHeight(120),
        padding: const EdgeInsets.symmetric(horizontal: 0),
        margin: EdgeInsets.zero,
        width: SizeConfig.screenWidth * 1,
        decoration:  BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
          color: Theme.of(context).appBarTheme.backgroundColor?.withOpacity(0.9),
        ),
        child: Column(
          children: [
            sizeBoxHeight(6),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_back, color: kRedButtonBG),
                  Container(
                    width: SizeConfig.screenWidth * 0.68,
                    height: getProportionateScreenHeight(40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).appBarTheme.foregroundColor,
                      boxShadow: [boxShadowFight()],
                    ),
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
                  lightBulbWidget(context),
                ],
              ),
            ),
            sizeBoxHeight(10),
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
                            style: kText20Bold,
                          ),
                          const Text(
                            'HOUSE ',
                            style: kTextGrey13Normal,
                            textAlign: TextAlign.justify,
                          ),
                          sizeBoxWidth(6),
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
                                padding: EdgeInsets.zero,
                                width: getProportionateScreenWidth(30),
                                height: getProportionateScreenHeight(30),
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .appBarTheme
                                        .foregroundColor,
                                    shape: BoxShape.circle,
                                    boxShadow: [boxShadowFight()]),
                                child: const Icon(
                                  Icons.stacked_bar_chart,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                              )),
                          sizeBoxWidth(6),
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
                                padding: EdgeInsets.zero,
                                width: getProportionateScreenWidth(30),
                                height: getProportionateScreenHeight(30),
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .appBarTheme
                                        .foregroundColor,
                                    shape: BoxShape.circle,
                                    boxShadow: [boxShadowFight()]),
                                child: const Icon(
                                  Icons.add,
                                  size: 16,
                                  color: Colors.red,
                                ),
                              ))
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '$price ',
                            style: kTextGreen20Bold,
                          ),
                          const Text(
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
                      Row(
                        children: [
                          Text(
                            '378.30 ',
                            style:
                                kTextWhite15Normal.copyWith(fontWeight: w500),
                          ),
                          const Text(
                            'CP  ',
                            style: kTextGrey14Normal,
                          ),
                          Text(
                            '15.890 ',
                            style:
                                kTextWhite15Normal.copyWith(fontWeight: w500),
                          ),
                          const Text(
                            'Tỷ',
                            style: kTextGrey14Normal,
                          ),
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
