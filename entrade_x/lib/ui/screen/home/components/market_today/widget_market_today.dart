import 'package:entrade_x/blocs/ideas/ideas_bloc.dart';
import 'package:entrade_x/constrants.dart';
import 'package:entrade_x/size_config.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../blocs/chart/chart_bloc.dart';
import '../../../../../strings.dart';
import '../../../../components/circle_k.dart';
import '../../mini_compo/build_dot.dart';
import '../../mini_compo/build_unx.dart';

class MarketTodayWidget extends StatefulWidget {
  const MarketTodayWidget({super.key});

  @override
  State<MarketTodayWidget> createState() => _MarketTodayWidgetState();
}

class _MarketTodayWidgetState extends State<MarketTodayWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(12)),
          child: Text(
            sCheckNow,
            style: kTextGrey16Normal.copyWith(fontWeight: w500),
          ),
        ),
        sizeBoxHeight(10),
        Container(
          padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(12),
              horizontal: getProportionateScreenWidth(8)),
          color: kBgHomeContainer,
          width: SizeConfig.screenWidth,
          child: Column(
            children: [
              const TimeWidget(),
              sizeBoxHeight(10),
              BlocBuilder<ChartBloc, ChartState>(
                buildWhen: (previous, current) => previous != current,
                builder: (context, state) {
                  if (state is ChartLoadingState) {
                    return const CircularProgressIndicator();
                  } else if (state is ChartSuccessState) {
                    return SizedBox(
                      height: SizeConfig.screenHeight * 0.2,
                      child: LineChart(
                        LineChartData(
                          gridData: const FlGridData(show: false),
                          titlesData: const FlTitlesData(show: false),
                          borderData: FlBorderData(
                            show: false,
                            border: Border.all(
                              color: const Color(0xff37434d),
                              width: 1,
                            ),
                          ),
                          minX: 0,
                          maxX: 12,
                          minY: 0,
                          maxY: 12,
                          lineBarsData: [
                            LineChartBarData(
                              spots: state.list,
                              isCurved: true,
                              color: kGreen,
                              dotData: const FlDotData(show: false),
                              belowBarData: BarAreaData(
                                show: true, // Hiển thị bóng
                                color: kGreen.withOpacity(0.2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(state.toString()),
                    );
                  }
                },
              ),
              sizeBoxHeight(5),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: buildDot(
                        width: SizeConfig.screenWidth * 0.2,
                        height: getProportionateScreenHeight(4)),
                  ),
                  Expanded(
                    flex: 1,
                    child: buildDot(
                        width: SizeConfig.screenWidth * 0.3,
                        height: getProportionateScreenHeight(4),
                        color: Colors.yellow),
                  ),
                  Expanded(
                    flex: 2,
                    child: buildDot(
                        width: SizeConfig.screenWidth * 0.4,
                        height: getProportionateScreenHeight(4),
                        color: kRedButtonBG),
                  ),
                ],
              ),
              sizeBoxHeight(5),
              BlocBuilder<IdeasBloc, IdeasState>(
                builder: (context, state) {
                  if (state is IdeasLoadingState) {
                    return const CircularProgressIndicator();
                  } else if (state is IdeasSuccessState) {
                    return Row(
                      children: [
                        selectedMethod(state, SizeConfig.screenWidth, 0),
                        sizeBoxWidth(4),
                        selectedMethod(state, SizeConfig.screenWidth, 1),
                        sizeBoxWidth(4),
                        selectedMethod(state, SizeConfig.screenWidth, 2),
                        sizeBoxWidth(4),
                      ],
                    );
                  } else {
                    return Center(
                      child: Text(state.toString()),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  InkWell selectedMethod(IdeasSuccessState state, double width, int index) {
    return buildUnx(
      color2: selectedIndex == index
          ? const Color(0xff54534c).withOpacity(0.4)
          : kBgHomeContainer,
      color: selectedIndex == index ? kRedButtonBG : Colors.transparent,
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      txt1: Text(
        '${state.stocks[index].name}-${state.stocks[index].producer}',
        style: kTextWhite15Normal,
      ),
      txt2: state.stocks[index].currentPrice - state.stocks[index].price > 0
          ? Text(
              '${state.stocks[index].currentPrice}',
              style: kTextGreen16Normal.copyWith(fontWeight: w500),
            )
          : Text(
              '${state.stocks[index].currentPrice}',
              style: kTextRed16Normal.copyWith(fontWeight: w500),
            ),
      txt3: Text(
        '${state.stocks[index].profit}(${state.stocks[index].revenue})',
        style: state.stocks[index].profit > 0
            ? kTextGreen16Normal
            : kTextRed16Normal,
      ),
      txt4: Text(
        '${state.stocks[index].totalPrice} tỷ',
        style: kTextGrey15Normal,
      ),
      width: width,
      isActive: false,
    );
  }
}

class TimeWidget extends StatefulWidget {
  const TimeWidget({
    super.key,
  });

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildRecBorder(
          func: () {
            context.read<ChartBloc>().add(ChartClickItemEvent(id: 0));
            setState(() {
              selectIndex = 0;
            });
          },
          demo: const Text('1W',
              textAlign: TextAlign.center, style: kTextWhite16Normal),
          color: selectIndex == 0 ? kRedButtonBG : Colors.black,
        ),
        sizeBoxWidth(10),
        buildRecBorder(
          func: () {
            context.read<ChartBloc>().add(ChartClickItemEvent(id: 1));
            setState(() {
              selectIndex = 1;
            });
          },
          demo: const Text('1M',
              textAlign: TextAlign.center, style: kTextWhite16Normal),
          color: selectIndex == 1 ? kRedButtonBG : Colors.black,
        ),
        sizeBoxWidth(10),
        buildRecBorder(
          func: () {
            context.read<ChartBloc>().add(ChartClickItemEvent(id: 2));
            setState(() {
              selectIndex = 2;
            });
          },
          demo: const Text(
            '6M',
            textAlign: TextAlign.center,
            style: kTextWhite16Normal,
          ),
          color: selectIndex == 2 ? kRedButtonBG : Colors.black,
        ),
        sizeBoxWidth(10),
        buildRecBorder(
          func: () {
            context.read<ChartBloc>().add(ChartClickItemEvent(id: 3));
            setState(() {
              selectIndex = 3;
            });
          },
          demo: const Text('1Y',
              textAlign: TextAlign.center, style: kTextWhite16Normal),
          color: selectIndex == 3 ? kRedButtonBG : Colors.black,
        ),
      ],
    );
  }
}
