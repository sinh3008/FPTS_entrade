import 'package:entrade_x/repo/i_data_info_fake.dart';
import 'package:entrade_x/ui/screen/home/body/components/event_money_rewards.dart';
import 'package:entrade_x/ui/screen/home/body/components/hots.dart';
import 'package:entrade_x/ui/screen/home/body/components/money_widget.dart';
import 'package:entrade_x/ui/screen/home/body/components/widget_market_today.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/chart/chart_bloc.dart';
import '../../../../blocs/money/money_bloc.dart';
import 'components/latest_news.dart';
import 'mini_compo/build_app_bar_home.dart';


class BodyHomeScreen extends StatefulWidget {
  const BodyHomeScreen({
    super.key,
  });

  @override
  State<BodyHomeScreen> createState() => _BodyHomeScreenState();
}

class _BodyHomeScreenState extends State<BodyHomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MoneyBloc>().add(ShowHideMoneyEvent());
    context.read<ChartBloc>().add(ChartClickItemEvent(id: 0));
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Scaffold(
      backgroundColor: const Color(0xff1c1c1c),
      appBar: buildAppBarHome(width, height, context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            const EventMoneyRewardsWidget(),
            SizedBox(
              height: height * 0.02,
            ),
            const MoneyWidget(),
            SizedBox(
              height: height * 0.02,
            ),
            const HostWidget(),
            SizedBox(
              height: height * 0.02,
            ),
            const MarketTodayWidget(),
            SizedBox(
              height: height * 0.02,
            ),
            LatestNews(),
          ],
        ),
      ),
    );
  }
}
