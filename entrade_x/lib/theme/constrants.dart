import 'package:flutter/material.dart';

import '../theme/size_config.dart';

Container lineBreak() {
  return Container(
    width: SizeConfig.screenWidth,
    height: 0.5,
    color: Colors.grey.withOpacity(0.2),
  );
}

const kAnimationDuration = Duration(milliseconds: 200);

//color
const kGreyColorCustom = Color(0xff222222);
const kBgCreateAccount = Color(0xff242527);

const kBgAppbarGrey = Color(0xff1d1d1d);

const kBlackBackgroundCustom = Color(0xff131313);

const kRedButtonBG = Color(0xffd34343);
const kBgBoxSearch = Color(0xff272729);
const kBgBottomSheet = Color(0xff202123);
const kBgHomeContainer = Color(0xff262626);
const kBgItemFollows = Color(0xff1c1c1c);

const kWhite = Colors.white;
const kGrey = Colors.grey;
const kGreen = Colors.green;

//weight
const w400 = FontWeight.w400;
const w500 = FontWeight.w500;
const w600 = FontWeight.w600;
const w700 = FontWeight.w700;
const bold = FontWeight.bold;

//const
const kLabelChartStyle = TextStyle(fontSize: 15);

const kText11 = TextStyle(fontSize: 11, fontWeight: w400);
const kText13 = TextStyle(fontSize: 13, fontWeight: w400);
const kText14 = TextStyle(fontSize: 14, fontWeight: w400);
const kText15 = TextStyle(fontSize: 15, fontWeight: w400);
const kText16 = TextStyle(fontSize: 16, fontWeight: w400);
const kText20 = TextStyle(fontSize: 20, fontWeight: w400);
const kText30 = TextStyle(fontSize: 30, fontWeight: w400);

final kTextGrey11Normal = kText11.copyWith(color: kGrey);
// final kTextGrey13Normal = kText13.copyWith(color: kGrey);
// final kTextGrey14Normal = kText14.copyWith(color: kGrey);
// final kTextGrey15Normal = kText15.copyWith(color: kGrey);
// final kTextGrey16Normal = kText16.copyWith(color: kGrey);
// final kTextGrey20Normal = kText20.copyWith(color: kGrey);
//
// final kTextRed11Normal = kText11.copyWith(color: kGrey);
// final kTextRed13Normal = kText13.copyWith(color: kGrey);
// final kTextRed14Normal = kText14.copyWith(color: kGrey);
// final kTextRed15Normal = kText15.copyWith(color: kGrey);
// final kTextRed16Normal = kText16.copyWith(color: kGrey);
// final kTextRed20Normal = kText20.copyWith(color: kGrey);

const kTextGrey13Normal =
    TextStyle(color: kGrey, fontSize: 13, fontWeight: w400);

const kTextGrey14Normal =
    TextStyle(color: kGrey, fontSize: 14, fontWeight: w400);

const kTextWhite14Bold = TextStyle(fontSize: 14, fontWeight: w500);

const kTextWhite15Normal = TextStyle(fontSize: 15, fontWeight: w400);
const kText15Normal = TextStyle(color: kWhite, fontSize: 15, fontWeight: w400);

const kTextRed15Normal =
    TextStyle(color: kRedButtonBG, fontSize: 15, fontWeight: w400);

const kTextGrey15Normal =
    TextStyle(color: kGrey, fontSize: 15, fontWeight: w400);

const kTextGreen15Normal =
    TextStyle(color: kGreen, fontSize: 15, fontWeight: w400);

const kTextWhite15Bold = TextStyle(fontSize: 15, fontWeight: bold);

const kText20Bold = TextStyle(fontSize: 20, fontWeight: bold);

const kTextGreen20Bold =
    TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.w600);

const kTextGrey20Bold =
    TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold);
// logo
const kText30Bold = TextStyle(fontSize: 30, fontWeight: w500);

//size
const kSizeIcons = 24.0;

const kSizeIconsHost = 16.0;
