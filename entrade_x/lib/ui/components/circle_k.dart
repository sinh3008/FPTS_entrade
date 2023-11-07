import 'package:entrade_x/theme/constrants.dart';
import 'package:flutter/material.dart';

import '../../other/strings.dart';
import '../../theme/app_colors.dart';
import '../../theme/size_config.dart';
import '../screen/home/components/ideas/investment_ideas.dart';

GestureDetector buildCircleK({
  required Widget demo,
  Color? color = kRedButtonBG,
  double width = 50,
  Border? border,
  double height = 50,
  BorderRadiusGeometry? borderRadius,
  BoxShape shape = BoxShape.circle,
  required VoidCallback onClicked,
  EdgeInsetsGeometry margin = const EdgeInsets.all(0),
  EdgeInsetsGeometry padding =
      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
}) {
  return GestureDetector(
    onTap: onClicked,
    child: Container(
      margin: margin,
      // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: padding,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        border: border,
        shape: shape,
        borderRadius: borderRadius,
      ),
      child: demo,
    ),
  );
}

GestureDetector buildRecBorder({
  required Widget demo,
  required Color color,
  double width = 50,
  double height = 40,
  BoxShape shape = BoxShape.rectangle,
  void Function()? func,
  int index = 0,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color,
          shape: shape,
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
              color: AppColor.blackPrimary.withOpacity(0.2),
              // Màu shadow
              spreadRadius: 1,
              // Bán kính bung
              blurRadius: 3,
              // Bán kính mờ
              offset: const Offset(0, 1),
            )
          ]),
      child: demo,
    ),
  );
}

GestureDetector lightBulbWidget(BuildContext context) {
  return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const InvestmentIdeas();
          },
        ));
      },
      child: Container(
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: getProportionateScreenWidth(40),
        height: getProportionateScreenHeight(40),
        decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.foregroundColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColor.blackPrimary.withOpacity(0.2),
                // Màu shadow
                spreadRadius: 1,
                // Bán kính bung
                blurRadius: 3,
                // Bán kính mờ
                offset: const Offset(0, 2),
              )
            ]),
        child: Image(
          image: const AssetImage(sLightBulb),
          fit: BoxFit.cover,
          color: Colors.yellow.shade400,
        ),
      ));
}

GestureDetector buildGestureDetectorRed(
    {required String text, required Decoration decoration}) {
  return GestureDetector(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: decoration,
      height: getProportionateScreenHeight(25),
      child: Center(
        child: Text(
          text,
          style: kTextWhite15Normal.copyWith(color: kWhite),
        ),
      ),
    ),
  );
}

BoxShadow boxShadowFight() {
  return BoxShadow(
    color: AppColor.blackPrimary.withOpacity(0.1),
    spreadRadius: 1,
    blurRadius: 2,
    offset: const Offset(0, 1),
  );
}
