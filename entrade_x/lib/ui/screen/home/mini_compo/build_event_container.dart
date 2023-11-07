import 'package:entrade_x/theme/constrants.dart';
import 'package:entrade_x/other/strings.dart';
import 'package:flutter/material.dart';

import '../../../../theme/size_config.dart';
import '../../../components/circle_k.dart';

GestureDetector buildEventContainer(
    {required String txt1,
    required String txt2,
    required void Function()? onTap,
    required String txt3,
    String iconPath = sReadyStock,
    required BuildContext context
    }) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(10),
          vertical: getProportionateScreenHeight(20)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).appBarTheme.backgroundColor
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child: Column(
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
          ),
          sizeBoxWidth(10),
          Expanded(
            flex: 2,
            child: buildCircleK(
              onClicked: onTap!,
              demo: Image(
                image: AssetImage(iconPath),
              ),
              color: kWhite,
            ),
          ),
        ],
      ),
    ),
  );
}
