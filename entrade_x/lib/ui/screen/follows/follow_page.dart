import 'package:contained_tab_bar_view_with_custom_page_navigator/contained_tab_bar_view_with_custom_page_navigator.dart';
import 'package:entrade_x/theme/size_config.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../../other/strings.dart';
import '../../../theme/constrants.dart';
import '../../../other/help_func.dart';
import '../../../repo/strings_title.dart';
import '../../components/circle_k.dart';
import '../../pages_test/order_page.dart';
import '../../pages_test/search_page.dart';
import '../home/components/ideas/investment_ideas.dart';
import 'components/bottom_sheet.dart';
import 'components/build_app_bar.dart';
import 'components/price_step_container.dart';
import 'components/order_matching_container.dart';
import 'components/senses_container.dart';

// ignore: must_be_immutable
class FollowsScreen extends StatefulWidget {
  double price = 42.25;

  FollowsScreen({Key? key}) : super(key: key);

  @override
  State<FollowsScreen> createState() => _FollowsScreenState();
}

class _FollowsScreenState extends State<FollowsScreen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // appBar: buildAppBarFollows(context, () {
        //   setState(() {
        //     widget.price = 42.25;
        //   });
        // }, widget.price),
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(120),
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      margin: EdgeInsets.zero,
                      width: SizeConfig.screenWidth * 1,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                        color: Theme.of(context)
                            .appBarTheme
                            .backgroundColor
                            ?.withOpacity(0.9),
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
                                const Icon(Icons.arrow_back,
                                    color: kRedButtonBG),
                                Container(
                                  width: SizeConfig.screenWidth * 0.68,
                                  height: getProportionateScreenHeight(40),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Theme.of(context)
                                        .appBarTheme
                                        .foregroundColor,
                                    boxShadow: [boxShadowFight()],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      sizeBoxWidth(10),
                                      Image(
                                        image: const AssetImage(sReadyStock),
                                        fit: BoxFit.cover,
                                        width: getProportionateScreenWidth(26),
                                        height:
                                            getProportionateScreenHeight(26),
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
                                              settings: RouteSettings(
                                                  name: Page2.routerName),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return const InvestmentIdeas();
                                                },
                                              ));
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.all(0),
                                              padding: EdgeInsets.zero,
                                              width:
                                                  getProportionateScreenWidth(
                                                      30),
                                              height:
                                                  getProportionateScreenHeight(
                                                      30),
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .appBarTheme
                                                      .foregroundColor,
                                                  shape: BoxShape.circle,
                                                  boxShadow: [
                                                    boxShadowFight()
                                                  ]),
                                              child: const Icon(
                                                Icons.stacked_bar_chart,
                                                size: 16,
                                                color: Colors.grey,
                                              ),
                                            )),
                                        sizeBoxWidth(6),
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return const InvestmentIdeas();
                                                },
                                              ));
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.all(0),
                                              padding: EdgeInsets.zero,
                                              width:
                                                  getProportionateScreenWidth(
                                                      30),
                                              height:
                                                  getProportionateScreenHeight(
                                                      30),
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .appBarTheme
                                                      .foregroundColor,
                                                  shape: BoxShape.circle,
                                                  boxShadow: [
                                                    boxShadowFight()
                                                  ]),
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
                                          '${widget.price} ',
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          style: kTextWhite15Normal.copyWith(
                                              fontWeight: w500),
                                        ),
                                        const Text(
                                          'CP  ',
                                          style: kTextGrey14Normal,
                                        ),
                                        Text(
                                          '15.890 ',
                                          style: kTextWhite15Normal.copyWith(
                                              fontWeight: w500),
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
                    Container(
                      margin: EdgeInsets.only(
                          top: getProportionateScreenHeight(10)),
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.screenHeight * 0.36,
                      decoration: BoxDecoration(
                        color: Theme.of(context).appBarTheme.foregroundColor,
                      ),
                      child: ContainedTabBarView(
                        tabBarProperties: TabBarProperties(
                          labelPadding: EdgeInsets.only(
                              left: getProportionateScreenWidth(16)),
                          padding: EdgeInsets.only(
                              top: getProportionateScreenHeight(6),
                              bottom: getProportionateScreenHeight(8)),
                          height: getProportionateScreenHeight(40),
                          alignment: TabBarAlignment.start,
                          indicatorColor: kRedButtonBG,
                          indicatorSize: TabBarIndicatorSize.label,
                          width: SizeConfig.screenWidth * 0.78,
                          unselectedLabelColor:
                              Theme.of(context).colorScheme.onBackground,
                          isScrollable: true,
                          margin: const EdgeInsets.all(0),
                          labelColor: kRedButtonBG,
                        ),
                        tabs: tabs,
                        views: [
                          SizedBox(
                            height: SizeConfig.screenHeight * 0.36,
                            child: BuocGiaContainer(
                              percentages: percentages,
                              percentages2: percentages2,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight * 0.36,
                            child: const OrderMatching(),
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight * 0.36,
                            child: BuocGiaContainer(
                              percentages: percentages,
                              percentages2: percentages2,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight * 0.36,
                            child: BuocGiaContainer(
                              percentages: percentages,
                              percentages2: percentages2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    sizeBoxHeight(10),
                    const SensesContainer(),
                    sizeBoxHeight(300),
                  ],
                ),
              ),
              // sbh(80),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: const CustomerBottomSheet(),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
