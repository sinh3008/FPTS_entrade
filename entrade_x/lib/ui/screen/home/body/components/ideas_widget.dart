import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../blocs/chart/chart_bloc.dart';
import '../../../../components/circle_k.dart';
import 'investment_ideas.dart';
Container IdeasWidget(double width, BuildContext context, double height) {
  return Container(
    padding: const EdgeInsets.all(12),
    width: width,
    color: const Color(0xff202123),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: width * 0.1,
              child: buildCircleK(
                onClicked: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const InvestmentIdeas();
                    },
                  ));
                },
                demo: const Image(
                  image: AssetImage('assets/images/lightbulb.png'),
                  fit: BoxFit.cover,
                ),
                color: const Color(0xff2c2d2f),
              ),
            ),
            SizedBox(
              width: width * 0.02,
            ),
            SizedBox(
              width: width * 0.8,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Có 3 ý tưởng đầu tư mới cho bạn',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Text(
                    'Xem ngay, đừng bỏ lỡ',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 15),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Row(
          children: [
            newMethod(width),
            SizedBox(
              width: width * 0.01,
            ),
            newMethod(width),
            SizedBox(
              width: width * 0.01,
            ),
            newMethod(width),
            Expanded(
              child: Container(
                height: width * 0.33,
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  child: const Text(
                    '->',
                    style: TextStyle(color: Colors.red),
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
      ],
    ),
  );
}
Container newMethod(double width) {
  return Container(
    padding: const EdgeInsets.all(8),
    width: width * 0.28,
    height: width * 0.3,
    decoration: BoxDecoration(
        color: const Color.fromARGB(255, 48, 61, 85),
        borderRadius: BorderRadius.circular(12)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'GMD',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const Text('65.40 0.6%', style: TextStyle(color: Colors.green)),
        BlocBuilder<ChartBloc, ChartState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            if (state is ChartLoadingState) {
              return const CircularProgressIndicator();
            } else if (state is ChartSuccessState) {
              return SizedBox(
                height: width * 0.12,
                width: width * 0.3,
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
      ],
    ),
  );
}
