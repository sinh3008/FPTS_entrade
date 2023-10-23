import 'package:entrade_x/constrants.dart';
import 'package:entrade_x/size_config.dart';
import 'package:entrade_x/strings.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../blocs/chart/chart_bloc.dart';
import '../../../../components/circle_k.dart';
import 'investment_ideas.dart';

class IdeasContainer extends StatelessWidget {
  const IdeasContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8)),
      width: SizeConfig.screenWidth,
      color: kBgHomeContainer,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: SizeConfig.screenWidth * 0.1,
                child: buildCircleK(
                  width: getProportionateScreenWidth(60),
                  height: getProportionateScreenWidth(60),
                  onClicked: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const InvestmentIdeas();
                      },
                    ));
                  },
                  demo: const Image(
                    image: AssetImage(sLightBulb),
                    width: 18,
                    height: 18,
                  ),
                  color: Colors.yellow.shade500.withOpacity(0.4),
                ),
              ),
              sbw(20),
              SizedBox(
                width: SizeConfig.screenWidth * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sIdeas,
                      style: kTextGreen16Normal.copyWith(fontWeight: w500),
                    ),
                    sbh(4),
                    const Text(
                      sSeeNow,
                      style: kTextWhite15Normal,
                    ),
                  ],
                ),
              )
            ],
          ),
          sbh(10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  newMethod(),
                  sbw(10),
                  newMethod(),
                  sbw(10),
                  newMethod(),
                ],
              ),
              Expanded(
                child: Container(
                  child: TextButton(
                    child: const Icon(
                      Icons.navigate_next,
                      color: kGreen,
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const InvestmentIdeas();
                        },
                      ));
                    },
                  ),
                ),
              )
            ],
          ),
          sbh(14),
        ],
      ),
    );
  }
}

Container newMethod() {
  return Container(
    padding: EdgeInsets.only(
        right: getProportionateScreenWidth(8),
        left: getProportionateScreenWidth(8),
        top: getProportionateScreenHeight(8)),
    width: SizeConfig.screenWidth * 0.28,
    height: getProportionateScreenHeight(140),
    decoration: BoxDecoration(
        color: kWhite.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'GMD',
          style: kTextWhite16Bold,
        ),
        const Text('65.40 0.6%', style: kTextGreen15Normal),
        sbh(4),
        BlocBuilder<ChartBloc, ChartState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            if (state is ChartLoadingState) {
              return const CircularProgressIndicator();
            } else if (state is ChartSuccessState) {
              return SizedBox(
                height: getProportionateScreenHeight(80),
                width: SizeConfig.screenHeight * 0.3,
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
                          color: Colors.green.withOpacity(0.1),
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
      ],
    ),
  );
}
