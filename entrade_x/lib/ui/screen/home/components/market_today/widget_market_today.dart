import 'package:entrade_x/blocs/ideas/ideas_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../blocs/chart/chart_bloc.dart';
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
    var screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 12, top: 8),
          child: Text(
            'Thị trường hôm nay?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          // color: const Color(0xff202123),
          color: const Color(0xff202123),
          // height: height * 0.3,
          width: width,
          child: Column(
            children: [
              const TimeWidget(),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<ChartBloc, ChartState>(
                buildWhen: (previous, current) => previous != current,
                builder: (context, state) {
                  if (state is ChartLoadingState) {
                    return const CircularProgressIndicator();
                  } else if (state is ChartSuccessState) {
                    return SizedBox(
                      height: height * 0.2,
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
                              color: Colors.green,
                              dotData: const FlDotData(show: false),
                              belowBarData: BarAreaData(
                                show: true, // Hiển thị bóng
                                color: Colors.green.withOpacity(0.2),
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
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  buildDot(width: width * 0.2, height: 2),
                  buildDot(
                      width: width * 0.3, height: 2, color: Colors.yellow),
                  buildDot(
                      width: width * 0.4, height: 2, color: Colors.red),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<IdeasBloc, IdeasState>(
                builder: (context, state) {
                  if (state is IdeasLoadingState) {
                    return const CircularProgressIndicator();
                  } else if (state is IdeasSuccessState) {
                    return Row(
                      children: [
                        selectedMethod(state, width, 0),
                        const SizedBox(
                          width: 4,
                        ),
                        selectedMethod(state, width, 1),
                        const SizedBox(
                          width: 4,
                        ),
                        selectedMethod(state, width, 2),
                        const SizedBox(
                          width: 4,
                        ),
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
          ? const Color(0xff54534c)
          : const Color(0xff202123),
      color: selectedIndex == index ? Colors.red : const Color(0xff202123),
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      txt1: Text(
        '${state.stocks[index].name}-${state.stocks[index].producer}',
        style: const TextStyle(color: Colors.grey),
      ),
      txt2: state.stocks[index].currentPrice - state.stocks[index].price > 0
          ? Text(
              '${state.stocks[index].currentPrice}',
              style: const TextStyle(
                  color: Colors.green, fontWeight: FontWeight.bold),
            )
          : Text(
              '${state.stocks[index].currentPrice}',
              style: const TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold),
            ),
      txt3: Text(
        '${state.stocks[index].profit}(${state.stocks[index].revenue})',
        style: state.stocks[index].profit > 0
            ? const TextStyle(
                color: Colors.green,
              )
            : const TextStyle(
                color: Colors.red,
              ),
      ),
      txt4: Text(
        '${state.stocks[index].totalPrice} tỷ',
        style: const TextStyle(color: Colors.grey),
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
          demo: const Text(
            '1W',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          color: selectIndex == 0 ? Colors.red : Colors.black,
        ),
        const SizedBox(
          width: 10,
        ),
        buildRecBorder(
          func: () {
            context.read<ChartBloc>().add(ChartClickItemEvent(id: 1));
            setState(() {
              selectIndex = 1;
            });
          },
          demo: const Text(
            '1M',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          color: selectIndex == 1 ? Colors.red : Colors.black,
        ),
        const SizedBox(
          width: 10,
        ),
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
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          color: selectIndex == 2 ? Colors.red : Colors.black,
        ),
        const SizedBox(
          width: 10,
        ),
        buildRecBorder(
          func: () {
            context.read<ChartBloc>().add(ChartClickItemEvent(id: 3));
            setState(() {
              selectIndex = 3;
            });
          },
          demo: const Text(
            '1Y',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          color: selectIndex == 3 ? Colors.red : Colors.black,
        ),
      ],
    );
  }
}
