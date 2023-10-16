import 'package:entrade_x/blocs/ideas/ideas_bloc.dart';
import 'package:entrade_x/models/stock.dart';
import 'package:entrade_x/ui/components/circle_k.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:entrade_x/blocs/chart/chart_bloc.dart';
import 'package:fl_chart/fl_chart.dart';

class InvestmentIdeas extends StatefulWidget {
  const InvestmentIdeas({super.key});

  @override
  State<InvestmentIdeas> createState() => _InvestmentIdeasState();
}

class _InvestmentIdeasState extends State<InvestmentIdeas> {
  @override
  void initState() {
    super.initState();
  }

  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;
    double width = screenSize.width;
    PageController pageController =
        PageController(viewportFraction: 0.8, keepPage: true);
    return Scaffold(
      backgroundColor: const Color(0xff131313),
      appBar: AppBar(),
      body: BlocBuilder<IdeasBloc, IdeasState>(
        builder: (context, state) {
          if (state is IdeasLoadingState) {
            return const CircularProgressIndicator();
          } else if (state is IdeasSuccessState) {
            return PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              controller: pageController,
              itemCount: state.stocks.length,
              itemBuilder: (context, index) {
                var scale = _selectedIndex == index ? 1.0 : 0.88;
                return TweenAnimationBuilder(
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: child,
                      );
                    },
                    tween: Tween(begin: scale, end: scale),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 12, left: 16, right: 16, bottom: 0),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 16),
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff1e1e20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(state.stocks[index].name),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              state.stocks[index].revenue > 0
                                  ? Text(
                                      '${state.stocks[index].profit}(+${state.stocks[index].revenue})')
                                  : Text(
                                      '${state.stocks[index].profit}(${state.stocks[index].revenue})'),
                            ],
                          ),
                          Text(
                              '${state.stocks[index].brand} - ${state.stocks[index].producer}'),
                          const SizedBox(
                            height: 10,
                          ),
                          BlocBuilder<ChartBloc, ChartState>(
                            buildWhen: (previous, current) =>
                                previous != current,
                            builder: (context, state) {
                              if (state is ChartLoadingState) {
                                return const CircularProgressIndicator();
                              } else if (state is ChartSuccessState) {
                                return SizedBox(
                                  height: height * 0.1,
                                  child: LineChart(
                                    LineChartData(
                                      gridData: const FlGridData(show: false),
                                      titlesData:
                                          const FlTitlesData(show: false),
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
                                      maxY: 30,
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
                          const Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Q2/21',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Q4/21',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Q2/22',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Q4/22',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Q2/23',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          bodyContainer(
                            width,
                            height,
                            state.stocks[index],
                          ),
                          contentValidate(width, height, state.stocks[index]),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Container(
                            height: 0.2,
                            width: width,
                            color: Colors.white,
                            alignment: Alignment.center,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              buildCircleK(
                                  width: 30,
                                  height: 30,
                                  padding: EdgeInsets.zero,
                                  demo: const Icon(
                                    Icons.add,
                                    color: Colors.red,
                                    size: 16,
                                  ),
                                  color: const Color(0xff393a3c),
                                  onClicked: () {
                                    showMenu(
                                        context: context,
                                        position: const RelativeRect.fromLTRB(
                                            140, 500.0, 205.0, 0.0),
                                        items: [
                                          const PopupMenuItem<String>(
                                              value: '1',
                                              child: Text('option 1')),
                                          const PopupMenuItem<String>(
                                              value: '2',
                                              child: Text('option 2')),
                                          const PopupMenuItem<String>(
                                              value: '3',
                                              child: Text('option 3')),
                                        ]);
                                  }),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              const Text(
                                '54',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                width: width * 0.1,
                              ),
                              buildCircleK(
                                padding: EdgeInsets.zero,
                                width: 30,
                                height: 30,
                                demo: const Icon(
                                  Icons.handyman,
                                  color: Colors.grey,
                                  size: 16,
                                ),
                                color: const Color(0xff393a3c),
                                onClicked: () {
                                  showMenu(
                                      context: context,
                                      position: const RelativeRect.fromLTRB(
                                          200.0, 500.0, 50.0, 0.0),
                                      items: [
                                        const PopupMenuItem<String>(
                                            value: '1',
                                            child: Text('option 1')),
                                        const PopupMenuItem<String>(
                                            value: '2',
                                            child: Text('option 2')),
                                        const PopupMenuItem<String>(
                                            value: '3',
                                            child: Text('option 3')),
                                      ]);
                                },
                              ),
                              const Text(
                                '109',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                        ],
                      ),
                    ));
              },
            );
          } else {
            return Center(
              child: Text(state.toString()),
            );
          }
        },
      ),
    );
  }

  Container contentValidate(double width, double height, Stock stock) {
    return Container(
      width: width,
      padding: EdgeInsets.only(top: height * 0.02),
      child: Column(
        children: [
          itemContentValidate(
            width,
            content:
                'Định giá P/E hôm nay: ${stock.pe}x, rẻ hơn P/E thị trường là ${stock.pe + 6}x',
          ),
          SizedBox(
            height: height * 0.02,
          ),
          itemContentValidate(
            width,
            content:
                'Lợi nhuận sau thuế quý 2/2023: +${stock.profit}% so với cùng kỳ, tốt hơn +12.40%',
          ),
          SizedBox(
            height: height * 0.02,
          ),
          itemContentValidate(
            width,
            content:
                'Doanh thu quý 2/2023: ${stock.revenue}% so với cùng kỳ, kém hơn +20.15%',
          ),
        ],
      ),
    );
  }

  Row itemContentValidate(
    double width, {
    required String content,
  }) {
    return Row(
      children: [
        Container(
          width: width * 0.05,
          height: width * 0.05,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Center(
            child: Icon(
              Icons.check,
              size: 14,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          width: width * 0.05,
        ),
        SizedBox(
          width: width * 0.5,
          child: Text(
            content,
            maxLines: 3,
          ),
        )
      ],
    );
  }

  Row bodyContainer(double width, double height, Stock stock) {
    return Row(
      children: [
        fixItemContainer(width, height,
            content: '${stock.pe}X',
            title: 'p/e'.toUpperCase(),
            color: Colors.purpleAccent),
        SizedBox(
          width: width * 0.01,
        ),
        fixItemContainer(width, height,
            content: '${stock.profit}',
            title: 'LN quý',
            color: Colors.orangeAccent),
        SizedBox(
          width: width * 0.01,
        ),
        fixItemContainer(
          width,
          height,
          content: '${stock.profit}',
          title: 'DT quý',
          color: Colors.green,
        ),
      ],
    );
  }

  Expanded fixItemContainer(double width, double height,
      {required String title, required String content, required Color color}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: width * 0.02, top: height * 0.01),
        width: width * 0.3,
        height: height * 0.09,
        decoration: BoxDecoration(
          color: color.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            Expanded(
              child: Text(
                content.toUpperCase(),
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
