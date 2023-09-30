// TODO Implement this library.
import 'package:entrade_x/ui/screen/home/body/body_home.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../components/circle_k.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text('Order Page, Click go to page 2'),
          onPressed: () {
            PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
              context,
              settings: RouteSettings(name: Page2.routerName),
              screen: const Page2(),
              withNavBar: true,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  static String routerName = 'inboxpage';

  const Page2({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          child: const Text('Page 2'),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const OrdersScreen();
                },
              ),
              (_) => false,
            );
          },
        ),
      ),
    );
  }
}
