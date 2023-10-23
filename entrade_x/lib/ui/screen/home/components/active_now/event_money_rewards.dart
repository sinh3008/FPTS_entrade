import 'package:entrade_x/constrants.dart';
import 'package:entrade_x/size_config.dart';
import 'package:entrade_x/toast.dart';
import 'package:flutter/material.dart';

import '../../../../../strings.dart';
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
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff202123),
      width: SizeConfig.screenWidth,
      child: Column(
        children: [
          sbh(20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  sEvent,
                  style: kTextWhite15Normal,
                ),
                InkWell(
                  onTap: () {
                    showToast(s200k);
                  },
                  child:  SizedBox(
                    width: getProportionateScreenWidth(25),
                    height: getProportionateScreenHeight(25),
                    child: const Image(
                      image: AssetImage(sHelp),
                      color: Colors.white,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ],
            ),
          ),
          sbh(6),
          const Text(
            '+0đ',
            style: kTextGreen16Normal,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return buildDot(
                index: index,
                width: SizeConfig.screenWidth * 0.3,
                height: 8,
                color: index == 0
                    ? const Color(0xff35c85e)
                    : const Color(0xff35c85e).withOpacity(0.5),
              );
            }),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.transparent,
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
                        color: Color(0xff35c85e),
                      ),
                      buildTextDemo(
                          width: SizeConfig.screenWidth,
                          title: 'Kích hoạt',
                          money: '+50,000đ',
                          colors: const Color(0xff35c85e)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            buildMycontainer2(
                                listRadius[0], Colors.green.withOpacity(1)),
                            buildMycontainer(listRadius[1]),
                            buildMycontainer(listRadius[2]),
                          ],
                        ),
                      ),
                      buildTextDemo(
                          width: SizeConfig.screenWidth,
                          title: 'Nộp tiền',
                          money: '+50,000đ'),
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
                          width: SizeConfig.screenWidth,
                          title: 'Đầu tư',
                          money: '+100,000đ'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          sbh(10),
          ButtonLoginWidget(
            radius: 30,
            width: SizeConfig.screenWidth * 0.4,
            height: getProportionateScreenHeight(40),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ActiveNowPage(id: 0),
                ),
              );
            },
            text: 'Nộp tiền ngay',
          ),
          sbh(20),
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
