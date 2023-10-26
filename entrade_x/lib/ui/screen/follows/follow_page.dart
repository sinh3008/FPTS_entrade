import 'package:contained_tab_bar_view_with_custom_page_navigator/contained_tab_bar_view_with_custom_page_navigator.dart';
import 'package:entrade_x/size_config.dart';
<<<<<<< HEAD
import 'package:entrade_x/ui/screen/follows/components/khop_lenh_container.dart';
import 'package:entrade_x/ui/screen/follows/components/senses_container.dart';
import 'package:entrade_x/ui/screen/follows/components/buoc_gia_container.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../constrants.dart';
=======
import 'package:entrade_x/ui/screen/follows/components/senses_widgets.dart';
import 'package:entrade_x/ui/screen/follows/components/widget_page_container.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

>>>>>>> origin/main
import '../../../help_func.dart';
import '../../../repo/strings_title.dart';
import 'components/bottom_sheet.dart';
import 'components/build_app_bar.dart';

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
<<<<<<< HEAD
        backgroundColor: kBlackBackgroundCustom,
=======
        backgroundColor: const Color(0xff131313),
>>>>>>> origin/main
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
                      // borderRadius: BorderRadius.circular(20),
                      color: Color(0xff1c1c1c),
                    ),
                    child: ContainedTabBarView(
<<<<<<< HEAD
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
=======
                      tabBarViewProperties: TabBarViewProperties(),
                      tabBarProperties: TabBarProperties(
                          labelPadding: const EdgeInsets.only(left: 16),
                          padding: const EdgeInsets.only(top: 8, bottom: 18),
                          height: getProportionateScreenHeight(50),
                          alignment: TabBarAlignment.start,
                          indicatorColor: Colors.red,
                          indicatorSize: TabBarIndicatorSize.label,
                          width: SizeConfig.screenWidth * 0.78,
                          unselectedLabelColor: Colors.white,
                          isScrollable: true,
                          margin: const EdgeInsets.all(0),
                          labelColor: Colors.red),
                      tabs: tabs,
                      views: [
                        PageContainer(
                          percentages: percentages,
                          percentages2: percentages2,
                        ),
                        PageContainer(
                          percentages: percentages,
                          percentages2: percentages2,
                        ),
                        PageContainer(
                          percentages: percentages,
                          percentages2: percentages2,
                        ),
                        PageContainer(
                          percentages: percentages,
                          percentages2: percentages2,
>>>>>>> origin/main
                        ),
                      ],
                    ),
                  ),
<<<<<<< HEAD
                  sbh(10),
                  const SensesContainer(),
                  sbh(300),
                ],
              ),
            ),
            // sbh(100),
=======
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  bodySenses(),
                  SizedBox(
                    height: getProportionateScreenHeight(300),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            SizedBox(
              height: getProportionateScreenHeight(80),
            ),
>>>>>>> origin/main
            const CustomerBottomSheet(),
          ],
        ),
      ),
    );
  }
<<<<<<< HEAD
=======

>>>>>>> origin/main
}
