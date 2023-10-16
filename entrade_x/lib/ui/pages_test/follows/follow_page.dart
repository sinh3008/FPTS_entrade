import 'package:contained_tab_bar_view_with_custom_page_navigator/contained_tab_bar_view_with_custom_page_navigator.dart';
import 'package:entrade_x/constrants.dart';
import 'package:entrade_x/size_config.dart';
import 'package:entrade_x/ui/pages_test/follows/widget_page_container.dart';
import 'package:flutter/material.dart';

import '../../../help_func.dart';
import 'bottom_sheet.dart';
import 'build_app_bar.dart';

// ignore: must_be_immutable
class FollowsScreen extends StatefulWidget {
  double price = 0;

  FollowsScreen({Key? key}) : super(key: key);

  @override
  State<FollowsScreen> createState() => _FollowsScreenState();
}

class _FollowsScreenState extends State<FollowsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff131313),
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
              children: [
                Container(
                  margin:
                      EdgeInsets.only(top: getProportionateScreenHeight(16)),
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight * 0.36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xff1c1c1c),
                  ),
                  child: ContainedTabBarView(
                    tabBarProperties: TabBarProperties(
                        // padding: EdgeInsets.only(left: 8),
                        height: getProportionateScreenHeight(50),
                        alignment: TabBarAlignment.start,
                        indicatorColor: Colors.red,
                        width: SizeConfig.screenWidth * 0.78,
                        unselectedLabelColor: Colors.white,
                        labelColor: Colors.red),
                    tabs: const [
                      Text('Bước giá'),
                      Text('Khớp lệnh'),
                      Text('Lô lẻ'),
                      Text('Sự kiện'),
                    ],
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
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(200),
                ),
                Container(
                  width: SizeConfig.screenWidth,
                  height: getProportionateScreenHeight(30),
                  color: Colors.orange,
                  child: const Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Senses',
                            style: TextStyle(color: kWhite),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(200),
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
          const CustomerBottomSheet(),
          // CustomerBottomSheet(price: widget.price, price1: widget.price),
        ],
      ),
    );
  }
}
