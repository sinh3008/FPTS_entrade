import 'package:entrade_x/constrants.dart';
import 'package:entrade_x/size_config.dart';
import 'package:entrade_x/strings.dart';
import 'package:flutter/material.dart';

import '../../../components/circle_k.dart';

GestureDetector buildEventContainer(
    {required String txt1,
    required String txt2,
    required void Function()? onTap,
    required String txt3,
    String iconPath = sReadyStock}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(12),
          vertical: getProportionateScreenHeight(20)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kBgHomeContainer,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                txt1,
                style: kTextGrey15Normal,
              ),
              Text(txt2.toUpperCase(),
                  style: kTextGreen16Normal.copyWith(fontWeight: w500)),
              Text(
                txt3,
                style: kTextGrey15Normal,
              ),
            ],
          ),
          sbw(10),
          buildCircleK(
            onClicked: onTap!,
            demo: Image(
              image: AssetImage(iconPath),
            ),
            color: kWhite,
          ),
        ],
      ),
    ),
  );
}
