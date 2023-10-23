import 'package:flutter/material.dart';

import 'size_config.dart';

const kAnimationDuration = Duration(milliseconds: 200);

const kGreyColorCustom = Color(0xff222222);

const kBlackBackgroundCustom = Color(0xff131313);

const kRedButtonBG = Color(0xffd34343);

const kLabelChartStyle = TextStyle(fontSize: 15);

const kWhite = Colors.white;
const kGrey = Colors.grey;

Container lineBreak() {
  return Container(
    width: SizeConfig.screenWidth,
    height: 0.5,
    color: Colors.white.withOpacity(0.2),
  );
}

