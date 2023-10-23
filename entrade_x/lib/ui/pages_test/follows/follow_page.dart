import 'package:auto_size_text/auto_size_text.dart';
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
                    tabs: const [
                      Text(
                        'Bước giá',
                        style: kLabelChartStyle,
                      ),
                      Text(
                        'Khớp lệnh',
                        style: kLabelChartStyle,
                      ),
                      Text(
                        'Lô lẻ',
                        style: kLabelChartStyle,
                      ),
                      Text(
                        'Sự kiện',
                        style: kLabelChartStyle,
                      ),
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
          const CustomerBottomSheet(),
        ],
      ),
    );
  }

  Widget bodySenses() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: SizeConfig.screenWidth,
      decoration: const BoxDecoration(
        color: Color(0xff1c1c1c),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Senses',
                style: TextStyle(color: kWhite, fontSize: 16),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Xem thêm',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '5 ngày',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '-3,39%',
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '1 năm',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '24.35%',
                    style: TextStyle(color: Colors.green, fontSize: 14),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Vốn hoá',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '137,204,89 tỷ',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'P/E',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '7.8x',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'P/S',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '2.9x',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Container(
            width: SizeConfig.screenWidth,
            height: 0.5,
            color: kGrey,
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tin liên quan',
                style: TextStyle(color: kWhite, fontSize: 16),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Xem thêm',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            ],
          ),
          const AutoSizeText(
            'Sacombank, Vietinbank, Vietcombank được dự báo dẫn đầu về tăng trưởng',
            style: TextStyle(fontSize: 14, color: kWhite),
            minFontSize: 12,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              container(text: 'CTG + 0.17%', color: Colors.green),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              container(text: 'CTG + 0.17%', color: Colors.redAccent),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              container(text: 'CTG + 0.17%', color: Colors.redAccent),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              container(text: '+1', color: Colors.redAccent),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Row(
            children: [
              const Icon(
                Icons.access_time_sharp,
                color: kGrey,
              ),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              const Text('2 giờ trước')
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Container(
            width: SizeConfig.screenWidth,
            height: 0.5,
            color: kGrey,
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AutoSizeText(
                          'Các quỹ đầu tư lạc quan về thị trường. Các quỹ đầu tư lạc quan về thị trường',
                          style: TextStyle(fontSize: 14, color: kWhite),
                          minFontSize: 12,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            container(
                                text: 'CTG + 0.17%', color: Colors.green),
                            SizedBox(
                              width: getProportionateScreenWidth(10),
                            ),
                            container(
                                text: 'CTG + 0.17%', color: Colors.redAccent),
                            SizedBox(
                              width: getProportionateScreenWidth(10),
                            ),
                            container(text: '+1', color: Colors.redAccent),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/trade.jpg'))),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.access_time_sharp,
                    color: kGrey,
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  const Text('2 giờ trước')
                ],
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Container(
            width: SizeConfig.screenWidth,
            height: 0.5,
            color: kGrey,
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Column(
            children: [
              const AutoSizeText(
                'Cổ phiếu ngân hàng đang được định giá thấp kỷ lục, một mã có tiềm năng tới 47%',
                style: TextStyle(fontSize: 14, color: kWhite),
                minFontSize: 12,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  container(text: 'CTG + 0.17%', color: Colors.green),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  container(text: 'CTG + 0.17%', color: Colors.redAccent),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  container(text: 'CTG + 0.17%', color: Colors.redAccent),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  container(text: '+1', color: Colors.redAccent),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.access_time_sharp,
                    color: kGrey,
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  const Text('2 giờ trước')
                ],
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
        ],
      ),
    );
  }

  Container container(
      {required Color color,
      required String text,
      EdgeInsetsGeometry? padding =
          const EdgeInsets.symmetric(horizontal: 6, vertical: 3)}) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color.withOpacity(0.2),
      ),
      child: Text(
        text,
        style:
            TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 14),
        textAlign: TextAlign.center,
      ),
    );
  }
}
