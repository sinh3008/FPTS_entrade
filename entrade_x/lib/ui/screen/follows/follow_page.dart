import 'package:contained_tab_bar_view_with_custom_page_navigator/contained_tab_bar_view_with_custom_page_navigator.dart';
import 'package:entrade_x/size_config.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../constrants.dart';
import '../../../help_func.dart';
import '../../../repo/strings_title.dart';
import 'components/bottom_sheet.dart';
import 'components/build_app_bar.dart';
import 'components/buoc_gia_container.dart';
import 'components/khop_lenh_container.dart';
import 'components/senses_container.dart';

// ignore: must_be_immutable
class FollowsScreen extends StatefulWidget {
  double price = 0;

  FollowsScreen({Key? key}) : super(key: key);

  @override
  State<FollowsScreen> createState() => _FollowsScreenState();
}

class _FollowsScreenState extends State<FollowsScreen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: kBlackBackgroundCustom,
        appBar: buildAppBarFollows(
          context,
          () {
            setState(() {
              widget.price = 42.45;
            });
          },
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(top: getProportionateScreenHeight(10)),
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.34,
                    decoration: const BoxDecoration(
                      color: kBgItemFollows,
                    ),
                    child: ContainedTabBarView(
                      tabBarProperties: TabBarProperties(
                        labelPadding: EdgeInsets.only(
                            left: getProportionateScreenWidth(16)),
                        padding: EdgeInsets.only(
                            top: getProportionateScreenHeight(6),
                            bottom: getProportionateScreenHeight(14)),
                        height: getProportionateScreenHeight(50),
                        alignment: TabBarAlignment.start,
                        indicatorColor: kRedButtonBG,
                        indicatorSize: TabBarIndicatorSize.label,
                        width: SizeConfig.screenWidth * 0.78,
                        unselectedLabelColor: Colors.white,
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
            const CustomerBottomSheet(),
          ],
        ),
      ),
    );
  }
}
