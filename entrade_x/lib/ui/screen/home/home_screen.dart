import 'package:entrade_x/ui/screen/home/body_home.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../pages_test/order_page.dart';
import '../../pages_test/follows/follow_page.dart';
import '../../pages_test/wallet_page.dart';
import '../../pages_test/message_page.dart';
import '../../pages_test/menu_page.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;
    controller = PersistentTabController(initialIndex: 0);

    // ignore: no_leading_underscores_for_local_identifiers
    List<Widget> _buildScreens() {
      return [
        const BodyHomeScreen(),
         FollowsScreen(),
        const OrdersScreen(),
        const WalletScreen(),
        const MessageScreen(),
        const MenuScreen(),
      ];
    }

    // ignore: no_leading_underscores_for_local_identifiers
    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: ('Home'),
          activeColorPrimary: Colors.red,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.area_chart),
          title: ("Follow"),
          activeColorPrimary: Colors.red,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.note_alt_outlined),
          title: ("Order"),
          activeColorPrimary: Colors.red,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.wallet),
          title: ("Wallet"),
          activeColorPrimary: Colors.red,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.message),
          title: ("Message"),
          activeColorPrimary: Colors.red,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.menu),
          title: ("Menu"),
          activeColorPrimary: Colors.red,
          inactiveColorPrimary: Colors.white,
        )
      ];
    }

    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.black,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style8,
    );
  }
}
