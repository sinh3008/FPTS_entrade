import 'package:entrade_x/ui/components/circle_k.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../components/button_default.dart';
import 'components/build_app_bar_home.dart';
import 'components/build_dot.dart';
import 'components/build_event_container.dart';
import 'components/build_text_demo.dart';
import 'components/build_unx.dart';

const kAnimationDuration = Duration(milliseconds: 200);

class BodyHome extends StatelessWidget {
  const BodyHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Scaffold(
      backgroundColor: const Color(0xff1c1c1c),
      appBar: buildAppBarHome(width, height),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              color: const Color(0xff202123),
              height: height * 0.3,
              width: width,
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width * 0.06,
                      ),
                      const Text(
                        'Chào Sinh, hãy hoàn thành để nhận 200,000đ',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Expanded(
                        child: InkWell(
                          onHover: (sss) {},
                          child: const SizedBox(
                            width: 30,
                            height: 30,
                            child: Image(
                              image: AssetImage('assets/images/help.png'),
                              color: Colors.white,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                    ],
                  ),
                  const Text(
                    '+0đ',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => buildDot(
                          index: index, width: width * 0.3, height: height),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildTextDemo(
                          width: width,
                          title: 'Kích hoạt',
                          money: '+50,000đ'),
                      buildTextDemo(
                          width: width, title: 'Nộp tiền', money: '+50,000đ'),
                      buildTextDemo(
                          width: width,
                          title: 'Đầu tư (5 triệu)',
                          money: '+100,000đ'),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  ButtonLoginWidget(
                    screenSize: screenSize,
                    onTap: () {},
                    text: 'Kích hoạt ngay',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                buildEventContainer(
                    txt1: 'Phí giao dịch',
                    txt2: 'Miễn phí',
                    txt3: 'trọn đời',
                    iconPath: 'assets/images/ready_stock.png'),
                const SizedBox(
                  width: 10,
                ),
                buildEventContainer(
                  txt1: 'Ấp trứng vàng',
                  txt2: '7.0%/năm',
                  txt3: 'Lợi suất',
                  iconPath: 'assets/images/ready_stock.png',
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
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
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              // color: const Color(0xff202123),
              color: const Color(0xff202123),
              // height: height * 0.3,
              width: width,
              child: Column(
                children: [
                  Row(
                    children: [
                      buildRecBorder(
                        demo: const Text(
                          '1W',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      buildRecBorder(
                        demo: const Text(
                          '1M',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      buildRecBorder(
                        demo: const Text(
                          '6M',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      buildRecBorder(
                        demo: const Text(
                          '1Y',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.black,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
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
                        maxX: 6,
                        minY: 0,
                        maxY: 6,
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              const FlSpot(0, 4),
                              const FlSpot(1, 5),
                              const FlSpot(2, 4),
                              const FlSpot(3, 2),
                              const FlSpot(4, 3),
                              const FlSpot(5, 1),
                              const FlSpot(6, 2),
                            ],
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
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      buildDot(width: width * 0.2, height: height),
                      buildDot(
                          width: width * 0.3,
                          height: height,
                          color: Colors.yellow),
                      buildDot(
                          width: width * 0.4,
                          height: height,
                          color: Colors.red),
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
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              // color: const Color(0xff202123),
              color: Colors.orange,
              height: height * 0.3,
              width: width,
              child: const Column(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
