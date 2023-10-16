import 'package:entrade_x/blocs/conditional/conditional_bloc.dart';
import 'package:entrade_x/blocs/ideas/ideas_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/bank/bankitem_bloc.dart';
import '../../../blocs/chart/chart_bloc.dart';
import '../../../blocs/money/money_bloc.dart';
import 'components/active_now/event_money_rewards.dart';
import 'components/co_gi_hay/co_gi_hay_widget.dart';
import 'components/hots/hots.dart';
import 'components/ideas/ideas_widget.dart';
import 'components/lastnew/latest_news.dart';
import 'components/market_today/widget_market_today.dart';
import 'components/money/money_widget.dart';
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
    context.read<IdeasBloc>().add(IdeasShowEvent());
    context.read<BankitemBloc>().add(BankClickedItemEvent(0));

    context.read<ConditionalBloc>().add(ClickFitPriceEvent(0));
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
            LatestNewsWidget(),
            SizedBox(
              height: height * 0.02,
            ),
            IdeasWidget(width, context, height),
            SizedBox(
              height: height * 0.02,
            ),
            CoGiHayWidget(width, height),
            SizedBox(
              height: height * 0.08,
            ),
          ],
        ),
      ),
    );
  }
}
