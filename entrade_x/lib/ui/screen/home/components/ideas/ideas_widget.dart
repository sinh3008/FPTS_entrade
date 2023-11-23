import 'package:entrade_x/theme/constrants.dart';
import 'package:entrade_x/other/strings.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../blocs/chart/chart_bloc.dart';
import '../../../../../theme/size_config.dart';
import '../../../../components/circle_k.dart';
import 'investment_ideas.dart';

class IdeasContainer extends StatefulWidget {
  const IdeasContainer({super.key});

  @override
  State<IdeasContainer> createState() => _IdeasContainerState();
}

class _IdeasContainerState extends State<IdeasContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8)),
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.foregroundColor
      ),
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
              sizeBoxWidth(20),
              SizedBox(
                width: SizeConfig.screenWidth * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sIdeas,
                      style: kTextGrey15Normal.copyWith(fontWeight: w500),
                    ),
                    sizeBoxHeight(4),
                    Text(
                      sSeeNow,
                      style: kTextWhite15Normal.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                  ],
                ),
              )
            ],
          ),
          sizeBoxHeight(10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  newMethod(),
                  sizeBoxWidth(10),
                  newMethod(),
                  sizeBoxWidth(10),
                  newMethod(),
                ],
              ),
              Expanded(
                // ignore: avoid_unnecessary_containers
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
          sizeBoxHeight(14),
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
          style: kTextWhite15Bold,
        ),
        const Text('65.40 0.6%', style: kTextGreen15Normal),
        sizeBoxHeight(4),
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
