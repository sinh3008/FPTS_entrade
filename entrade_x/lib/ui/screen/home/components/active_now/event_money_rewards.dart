import 'package:entrade_x/size_config.dart';
import 'package:entrade_x/toast.dart';
import 'package:flutter/material.dart';

import '../../../../components/button_default.dart';
import '../../mini_compo/build_dot.dart';
import '../../mini_compo/build_text_demo.dart';
import 'active_now.dart';

class EventMoneyRewardsWidget extends StatefulWidget {
  const EventMoneyRewardsWidget({super.key});

  @override
  State<EventMoneyRewardsWidget> createState() =>
      _EventMoneyRewardsWidgetState();
}

class _EventMoneyRewardsWidgetState extends State<EventMoneyRewardsWidget>
    with SingleTickerProviderStateMixin {
  // ignore: unused_field
  late Animation _animation;
  late AnimationController _animationController;

  var listRadius = [6.0, 15.0, 20.0];
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 4), lowerBound: 0.4);
    _animationController.addListener(() {
      setState(() {});
    });

    // Add a status listener to restart the animation when it completes.
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    // Start the animation.
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Container(
      color: const Color(0xff202123),
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
                  onTap: () {
                    showToast('Hãy hoàn thành để nhận 200,000 đ');
                  },
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
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return buildDot(
                index: index,
                width: width * 0.3,
                height: 8,
                color: index == 0
                    ? Colors.lightGreenAccent
                    : Colors.lightGreen.withOpacity(0.5),
              );
            }),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: getProportionateScreenHeight(50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: getProportionateScreenWidth(10),
                      ),
                      const Icon(
                        Icons.check,
                        size: 16,
                        color: Colors.lightGreenAccent,
                      ),
                      buildTextDemo(
                          width: width,
                          title: 'Kích hoạt',
                          money: '+50,000đ',
                          colors: Colors.lightGreenAccent),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          buildMycontainer2(
                              listRadius[0], Colors.green.withOpacity(1)),
                          buildMycontainer(listRadius[1]),
                          buildMycontainer(listRadius[2]),
                        ],
                      ),
                      buildTextDemo(
                          width: width, title: 'Nộp tiền', money: '+50,000đ'),
                    ],
                  ),
                ),
                 Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          buildMycontainer2(
                              listRadius[0], Colors.grey.withOpacity(1)),
                        ],
                      ),
                      buildTextDemo(
                          width: width, title: 'Đầu tư (5 triệu)', money: '+100,000đ'),
                    ],
                  ),
                ),
                // Expanded(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Stack(
                //         children: [
                //           buildMycontainer2(
                //               listRadius[0], Colors.grey.withOpacity(1)),
                //         ],
                //       ),
                //       buildTextDemo(
                //           width: width,
                //           title: 'Đầu tư (5 triệu)',
                //           money: '+100,000đ'),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          ButtonLoginWidget(
            width: SizeConfig.screenWidth * 0.3,
            height: getProportionateScreenHeight(40),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ActiveNowPage(id: 0),
                ),
              );
            },
            text: 'Nạp tiền ngay',
          ),
          SizedBox(
            height: height * 0.02,
          ),
        ],
      ),
    );
  }

  Widget buildMycontainer(radius) {
    return Container(
      width: radius * _animationController.value,
      height: radius * _animationController.value,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green.withOpacity(1.0 - _animationController.value)),
    );
  }

  Widget buildMycontainer2(radius, color) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
