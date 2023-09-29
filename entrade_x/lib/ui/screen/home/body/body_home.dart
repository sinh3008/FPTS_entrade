import 'package:entrade_x/repo/i_data_info_fake.dart';
import 'package:entrade_x/ui/screen/home/body/components/event_money_rewards.dart';
import 'package:entrade_x/ui/screen/home/body/components/hots.dart';
import 'package:entrade_x/ui/screen/home/body/components/widget_market_today.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/chart/chart_bloc.dart';
import 'mini_compo/build_app_bar_home.dart';

const kAnimationDuration = Duration(milliseconds: 200);

class BodyHome extends StatefulWidget {
  const BodyHome({
    super.key,
  });

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  @override
  void initState() {
    super.initState();
    context.read<ChartBloc>().add(ChartClickItemEvent(id: 0));
  }

  IDataInfoFake infoFake = IDataInfoFake();

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
            const HostWidget(),
            SizedBox(
              height: height * 0.02,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12, top: 8),
              child: Text(
                'Thị trường hôm nay?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const MarketTodayWidget(),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: width * 0.03),
                const Text(
                  'Tin vĩ mô',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: width * 0.03),
                InkWell(
                  onHover: (sss) {},
                  child: const SizedBox(
                    width: 28,
                    height: 28,
                    child: Icon(Icons.info_outline),
                  ),
                ),
                const Expanded(
                  child: Text(
                    'Xem tất cả',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
                SizedBox(
                  width: width * 0.03,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            SizedBox(
              width: width,
              height: 120,
              child: PageView.builder(
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  width: width,
                  color: const Color(0xff202123),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: width * 0.6,
                                child: Text(
                                  infoFake.list[index].title,
                                  style: _biggerFont,
                                  maxLines: 2,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(infoFake.list[index].time),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text(infoFake.list[index].author),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: width * 0.3,
                            child: Image(
                              image: AssetImage(infoFake.list[index].imagePath),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Text(
                          '${index + 1}/${infoFake.list.length}',
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ),
                scrollDirection: Axis.horizontal,
                itemCount: infoFake.list.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static const _biggerFont = TextStyle(fontSize: 18.0, color: Colors.white);
}
