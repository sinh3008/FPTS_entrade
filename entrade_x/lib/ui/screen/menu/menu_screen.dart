import 'package:entrade_x/theme/constrants.dart';
import 'package:entrade_x/ui/components/circle_k.dart';
import 'package:entrade_x/ui/screen/menu/page/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../../theme/size_config.dart';
import 'components/appbar.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildBuildCircleK(
                      context: context,
                      text: 'Smart OTP',
                      icon: Icons.shield_moon_outlined,
                      onClicked: () {}),
                  buildBuildCircleK(
                      context: context,
                      text: 'Cá nhân',
                      icon: Icons.person_outline,
                      onClicked: () {}),
                  buildBuildCircleK(
                      context: context,
                      text: 'Hướng dẫn',
                      icon: Icons.school_outlined,
                      onClicked: () {}),
                  buildBuildCircleK(
                      context: context,
                      text: 'Sản phẩm',
                      icon: Icons.wallet_travel_outlined,
                      onClicked: () {}),
                  buildBuildCircleK(
                      context: context,
                      text: 'Cài đặt',
                      icon: Icons.settings_outlined,
                      onClicked: () {
                        pushNewScreenWithRouteSettings(
                          context,
                          settings: RouteSettings(name: SettingPage.routerName),
                          screen: const SettingPage(),
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      }),
                ],
              ),
            ),
            buildContainer(
              context: context,
              icon: Icons.refresh,
              text: 'Chuyển tài khoản',
              widget: Center(
                child: Text(
                  'Mới',
                  style: kTextGrey11Normal.copyWith(
                      color: Colors.white, fontSize: 12),
                ),
              ),
              color: kRedButtonBG,
            ),
            sizeBoxHeight(8),
            Container(
              color: kBgItemFollows,
              child: Column(
                children: [
                  buildContainer(
                    context: context,
                    icon: Icons.wallet_rounded,
                    text: 'Nộp tiền',
                    widget: Container(),
                  ),
                  buildContainer(
                    context: context,
                    icon: Icons.wallet_rounded,
                    text: 'Chuyển tiền',
                    widget: Container(
                      alignment: Alignment.centerRight,
                      child: const Icon(
                        Icons.navigate_next_outlined,
                        color: kGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            sizeBoxHeight(8),
            buildContainer(
              context: context,
              icon: Icons.monetization_on_outlined,
              text: 'Giao dịch tiền phái sinh',
              widget: Container(
                alignment: Alignment.centerRight,
                child: const Icon(
                  Icons.navigate_next_outlined,
                  color: kGrey,
                ),
              ),
            ),
            sizeBoxHeight(8),
            Container(
              color: kBgItemFollows,
              child: Column(
                children: [
                  buildContainer(
                    context: context,
                    icon: Icons.clean_hands_outlined,
                    text: 'Các khoản vay',
                    widget: Container(
                      alignment: Alignment.centerRight,
                      child: const Icon(
                        Icons.navigate_next_outlined,
                        color: kGrey,
                      ),
                    ),
                  ),
                  buildContainer(
                    context: context,
                    icon: Icons.screen_search_desktop_outlined,
                    text: 'Tra cứu lịch sử',
                    widget: Container(
                      alignment: Alignment.centerRight,
                      child: const Icon(
                        Icons.navigate_next_outlined,
                        color: kGrey,
                      ),
                    ),
                  ),
                  buildContainer(
                    context: context,
                    icon: Icons.note_alt_outlined,
                    text: 'Xác nhận lệnh',
                    widget: Container(
                      alignment: Alignment.centerRight,
                      child: const Icon(
                        Icons.navigate_next_outlined,
                        color: kGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            sizeBoxHeight(8),
            buildContainer(
              context: context,
              icon: Icons.egg_outlined,
              text: 'Trứng vàng',
              widget: Container(
                alignment: Alignment.centerRight,
                child: const Icon(
                  Icons.navigate_next_outlined,
                  color: kGrey,
                ),
              ),
            ),
            sizeBoxHeight(8),
            Container(
              color: kBgItemFollows,
              child: Column(
                children: [
                  buildContainer(
                    context: context,
                    icon: Icons.card_giftcard_outlined,
                    text: 'Quà tặng',
                    widget: Container(
                      alignment: Alignment.centerRight,
                      child: const Icon(
                        Icons.navigate_next_outlined,
                        color: kGrey,
                      ),
                    ),
                  ),
                  buildContainer(
                    context: context,
                    icon: Icons.person_4_outlined,
                    text: 'Giới thiệu bạn bè',
                    widget: Container(
                      alignment: Alignment.centerRight,
                      child: const Icon(
                        Icons.navigate_next_outlined,
                        color: kGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            sizeBoxHeight(8),
            Container(
              color: kBgItemFollows,
              child: Column(
                children: [
                  buildContainer(
                    context: context,
                    icon: Icons.support_agent,
                    text: 'Hỗ trợ',
                    widget: Container(
                      alignment: Alignment.centerRight,
                      child: const Icon(
                        Icons.navigate_next_outlined,
                        color: kGrey,
                      ),
                    ),
                  ),
                  buildContainer(
                    context: context,
                    icon: Icons.mark_unread_chat_alt_rounded,
                    text: 'Gửi ý kiến phản hồi',
                    widget: Container(
                      alignment: Alignment.centerRight,
                      child: const Icon(
                        Icons.navigate_next_outlined,
                        color: kGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            sizeBoxHeight(8),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(8)),
                decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.foregroundColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [boxShadowFight()]),
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(16),
                    vertical: getProportionateScreenHeight(12)),
                width: SizeConfig.screenWidth,
                child: Center(
                  child: GestureDetector(
                    onTap: (){
                      // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      //     const LoginScreen()), (Route<dynamic> route) => false);
                    },
                    child: Text(
                      'Đăng xuất',
                      style: kText15Normal.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                  ),
                ),
              ),
            ),
            sizeBoxHeight(8),
            const Center(
              child: Text(
                'Phiên bản 2.67.7',
                style: kTextGrey14Normal,
              ),
            ),
            sizeBoxHeight(8),
          ],
        ),
      ),
    );
  }

  Container buildContainer({
    required IconData icon,
    required String text,
    required BuildContext context,
    required Widget widget,
    Color color = Colors.transparent,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(16),
          vertical: getProportionateScreenHeight(12)),
      width: SizeConfig.screenWidth,
      color: Theme.of(context).appBarTheme.foregroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.zero,
              child: Icon(
                icon,
                color: kGrey,
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Text(
              text,
              style: kText15Normal.copyWith(
                  color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
          Expanded(
            flex: 2,
            child: buildCircleK(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(30),
              height: getProportionateScreenHeight(22),
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              demo: widget,
              color: color,
              onClicked: () {},
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector buildBuildCircleK(
      {required String text,
      required IconData icon,
      required BuildContext context,
      required void Function() onClicked}) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.all(0),
        width: getProportionateScreenWidth(68),
        height: getProportionateScreenHeight(70),
        decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.foregroundColor,
            borderRadius: BorderRadius.circular(8),
            shape: BoxShape.rectangle,
            boxShadow: [boxShadowFight()]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: kRedButtonBG,
            ),
            Text(
              text,
              style: kTextGrey11Normal,
            )
          ],
        ),
      ),
    );
  }
}
