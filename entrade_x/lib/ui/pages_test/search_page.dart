import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../other/strings.dart';
import '../../theme/constrants.dart';
import '../../theme/size_config.dart';
import '../components/circle_k.dart';
import '../screen/home/components/ideas/investment_ideas.dart';
import 'order_page.dart';

class SearchPage extends StatelessWidget {
  static String routerName = 'inboxpage';

  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        FocusManager.instance.primaryFocus?.unfocus(); // Ẩn bàn phím
        return true; // Cho phép quay lại màn hình trước đó
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:
              Theme.of(context).appBarTheme.backgroundColor?.withOpacity(0.9),
          automaticallyImplyLeading: false,
          elevation: 1,
          toolbarHeight: getProportionateScreenHeight(80),
          flexibleSpace: SafeArea(
            child: Container(
              padding:
                  EdgeInsets.only(bottom: getProportionateScreenHeight(2)),
              width: SizeConfig.screenWidth,
              height:getProportionateScreenHeight(200),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  sizeBoxWidth(16),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SizedBox(
                      height: getProportionateScreenHeight(200),
                      width: getProportionateScreenWidth(30),
                      child: const Icon(Icons.arrow_back, color: kRedButtonBG),
                    ),
                  ),
                  sizeBoxWidth(8),
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
                              autofocus: true,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: sSearchCoin,
                                hintStyle: kTextGrey15Normal,
                              ),
                              onTap: () {
                                pushNewScreenWithRouteSettings(
                                  context,
                                  settings:
                                      RouteSettings(name: Page2.routerName),
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
                  sizeBoxWidth(16),
                ],
              ),
            ),
          ),
        ),
        body: Center(
          child: TextButton(child: const Text('Tìm kiếm'), onPressed: () {}),
        ),
      ),
    );
  }
}
