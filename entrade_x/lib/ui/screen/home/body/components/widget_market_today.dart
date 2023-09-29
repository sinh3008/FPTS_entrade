import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../blocs/chart/chart_bloc.dart';
import '../../../../components/circle_k.dart';
import '../mini_compo/build_dot.dart';
import '../mini_compo/build_unx.dart';

class MarketTodayWidget extends StatefulWidget {
  const MarketTodayWidget({super.key});

  @override
  State<MarketTodayWidget> createState() => _MarketTodayWidgetState();
}

class _MarketTodayWidgetState extends State<MarketTodayWidget> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Container(
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
                          color: Colors.redAccent,
                          dotData: const FlDotData(show: false),
                          belowBarData: BarAreaData(
                            show: true, // Hiển thị bóng
                            color: Colors.red.withOpacity(0.2),
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
              buildDot(width: width * 0.2, height: height),
              buildDot(
                  width: width * 0.3, height: height, color: Colors.yellow),
              buildDot(width: width * 0.4, height: height, color: Colors.red),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 4,
              ),
              buildUnx(
                txt1: 'VN-INDEX',
                txt2: '1149.36',
                txt3: '-3.84(-0.33%)',
                txt4: '3,666.273 tỷ',
                width: width,
                isActive: true,
              ),
              const SizedBox(
                width: 4,
              ),
              buildUnx(
                txt1: 'VN30',
                txt2: '1159.48',
                txt3: '-0.46(-0.04%)',
                txt4: '1,331.273 tỷ',
                width: width,
                isActive: false,
              ),
              const SizedBox(
                width: 4,
              ),
              buildUnx(
                txt1: 'VN-INDEX',
                txt2: '1149.36',
                txt3: '-3.84(-0.33%)',
                txt4: '3,666.273 tỷ',
                width: width,
                isActive: false,
              ),
              const SizedBox(
                width: 4,
              ),
            ],
          ),
        ],
      ),
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
              fontSize: 16,
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
          demo: Text(
            '1M',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
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
          demo: Text(
            '6M',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
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
          demo: Text(
            '1Y',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
            ),
          ),
          color: selectIndex == 3 ? Colors.red : Colors.black,
        ),
      ],
    );
  }
}
