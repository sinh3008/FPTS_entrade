import 'dart:core';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:entrade_x/blocs/conditional/conditional_bloc.dart';
import 'package:entrade_x/other/help_func.dart';
import 'package:entrade_x/theme/app_colors.dart';
import 'package:entrade_x/ui/components/circle_k.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../theme/constrants.dart';
import '../../../../theme/size_config.dart';

class CustomerBottomSheet extends StatefulWidget {
  const CustomerBottomSheet({Key? key}) : super(key: key);

  @override
  State<CustomerBottomSheet> createState() => _CustomerBottomSheetState();
}

class _CustomerBottomSheetState extends State<CustomerBottomSheet> {
  TextEditingController controllerGiaStop = TextEditingController();
  TextEditingController controllerGiaDat = TextEditingController();
  TextEditingController controllerKL = TextEditingController();

  int mass = 0;
  static double money = 10000000;
  double price = 42.25;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controllerGiaStop.dispose();
    controllerGiaDat.dispose();
    controllerKL.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Container(
        padding: EdgeInsets.only(bottom: getProportionateScreenHeight(8)),
        decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.foregroundColor,
          borderRadius: const BorderRadius.only(),
        ),
        child: BlocBuilder<ConditionalBloc, ConditionalState>(
          builder: (context, state) {
            if (state is ConditionalFitSuccessState) {
              if (state.priceFit != 0.0) {
                controllerGiaDat.text = state.priceFit.toString();
                controllerGiaStop.text = state.priceFit.toString();
              } else {}
              return Column(
                children: [
                  lineBreak(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(8),
                        vertical: getProportionateScreenHeight(0)),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              bottom: getProportionateScreenHeight(8),
                              top: getProportionateScreenHeight(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Sức mua:',
                                    style: kTextGrey16Normal,
                                  ),
                                  sizeBoxWidth(4),
                                  AutoSizeText(
                                    formatCurrency(money),
                                    maxLines: 2,
                                    style: kTextWhite14Bold,
                                  ),
                                  sizeBoxWidth(6),
                                  buildCircleK(
                                    shape: BoxShape.rectangle,
                                    width: getProportionateScreenWidth(18),
                                    borderRadius: BorderRadius.circular(2),
                                    height: getProportionateScreenHeight(18),
                                    padding: EdgeInsets.zero,
                                    demo: const Icon(
                                      Icons.add,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                    color: kRedButtonBG,
                                    onClicked: () {
                                      setState(() {
                                        money += 1000000000;
                                      });
                                    },
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  buildGestureDetectorRed(
                                    text: 'Lệnh điều kiện',
                                    decoration: BoxDecoration(
                                        color: kRedButtonBG,
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColor.blackPrimary
                                                .withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 3,
                                            offset: const Offset(0, 2),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  sizeBoxWidth(10),
                                  SizedBox(
                                    width: getProportionateScreenWidth(10),
                                  ),
                                  const Center(
                                    child: Icon(
                                      Icons.settings_outlined,
                                      color: kRedButtonBG,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: getProportionateScreenHeight(3)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Khi giá',
                                      style: kTextWhite15Normal,
                                    ),
                                    moeCaiNut(
                                        isSelectedS: isSelected,
                                        text1: '≥',
                                        text2: '≤'),
                                  ],
                                ),
                              ),
                              sizeBoxWidth(20),
                              btnGiaSTOP()
                            ],
                          ),
                        ),
                        sizeBoxHeight(4),
                        Column(
                          children: [
                            Container(
                              width: SizeConfig.screenWidth,
                              padding: EdgeInsets.symmetric(
                                  vertical: getProportionateScreenHeight(3)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Kích hoạt',
                                          style: kTextWhite15Normal,
                                        ),
                                        Row(
                                          children: [
                                            moeCaiNut(
                                              isSelectedS: isSelected2,
                                              text1: 'LO',
                                              text2: 'MP',
                                              inputSizeBox: 10,
                                              fontSize: 16,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: getProportionateScreenWidth(
                                                50)),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: kRedButtonBG,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            boxShadowFight(),
                                          ],
                                        ),
                                        height: 26,
                                        child: Center(
                                          child: Text(
                                            'Ký quỹ 100%',
                                            style: kTextWhite15Normal.copyWith(
                                                color: kWhite),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            sizeBoxHeight(6),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (isSelected2[0])
                                    btnGiaDat()
                                  else
                                    btnGiaKhongDuocDat(),
                                  sizeBoxWidth(20),
                                  btnKhoiLuong(),
                                ],
                              ),
                            ),
                          ],
                        ),
                        sizeBoxHeight(8),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Row(
                                children: [
                                  SizedBox(
                                    width: getProportionateScreenWidth(60),
                                    child: const Text(
                                      'Hết hạn',
                                    ),
                                  ),
                                  btnTime(context),
                                ],
                              )),
                              SizedBox(
                                width: getProportionateScreenWidth(20),
                              ),
                              btnDate(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(4),
                        ),
                        Container(
                          width: SizeConfig.screenWidth,
                          padding: EdgeInsets.only(
                              top: getProportionateScreenHeight(6)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: buildCircleK(
                                  borderRadius: BorderRadius.circular(4),
                                  shape: BoxShape.rectangle,
                                  padding: const EdgeInsets.only(top: 6),
                                  width: SizeConfig.screenWidth * 0.46,
                                  demo: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text('Có lỗi xảy ra'),
                                              // Nội dung thông báo
                                              backgroundColor: Colors.red,
                                              // Màu nền của thông báo
                                              action: SnackBarAction(
                                                label: 'Đóng',
                                                // Nhãn cho nút đóng
                                                onPressed: () {
                                                  ScaffoldMessenger.of(context)
                                                      .hideCurrentSnackBar(); // Đóng thông báo khi nút được nhấn
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          'MUA',
                                          style: TextStyle(color: kWhite),
                                        ),
                                      ),
                                      Text(
                                        '(${state.number.toStringAsFixed(0)})',
                                        style: const TextStyle(color: kWhite),
                                      ),
                                    ],
                                  ),
                                  color: Colors.green,
                                  onClicked: () {},
                                ),
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(16),
                              ),
                              Expanded(
                                child: buildCircleK(
                                  borderRadius: BorderRadius.circular(4),
                                  shape: BoxShape.rectangle,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6),
                                  width: SizeConfig.screenWidth * 0.46,
                                  demo: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'BÁN',
                                        style: TextStyle(color: kWhite),
                                      ),
                                      Text(
                                        '0',
                                        style: TextStyle(color: kWhite),
                                      ),
                                    ],
                                  ),
                                  color: kRedButtonBG,
                                  onClicked: () {},
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            } else {
              return Center(
                child: Text(state.toString()),
              );
            }
          },
        ),
      ),
    );
  }

  Expanded btnDate() {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: kGrey, width: 0.5),
          ),
        ),
        child: GestureDetector(
          onTap: _selectedDate,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(getFormattedDate(departureDate, pattern: 'dd/MM/yyyy'),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground)),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              const Icon(
                Icons.calendar_month_outlined,
                color: AppColor.redPrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded btnTime(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: kGrey, width: 0.5),
          ),
        ),
        child: GestureDetector(
          onTap: _selectedTime,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                timesss.format(context),
              ),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              const Icon(
                Icons.access_time_outlined,
                color: AppColor.redPrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded btnGiaSTOP() {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: kGrey, width: 0.5),
          ),
        ),
        height: getProportionateScreenHeight(40),
        child: TextField(
          textAlign: TextAlign.center,
          controller: controllerGiaStop,
          style: kTextWhite15Normal.copyWith(
              color: Theme.of(context).colorScheme.onBackground),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Giá STOP',
            prefixIcon: GestureDetector(
              onTap: () {
                if (controllerGiaStop.text.isEmpty) {
                  double currentMass = 42.25;
                  currentMass -= 1;
                  controllerGiaStop.text = (currentMass + 1).toStringAsFixed(2);
                } else {
                  double currentMass = double.parse(controllerGiaStop.text);
                  currentMass -= 1;
                  controllerGiaStop.text = currentMass.toStringAsFixed(2);
                }
              },
              child: nutBam(Alignment.centerLeft, Icons.remove,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            contentPadding: const EdgeInsets.all(10),
            suffixIcon: GestureDetector(
              onTap: () {
                if (controllerGiaStop.text.isEmpty) {
                  double currentMass = 42.25;
                  currentMass += 1;
                  controllerGiaStop.text = (currentMass - 1).toStringAsFixed(2);
                } else {
                  double currentMass = double.parse(controllerGiaStop.text);
                  currentMass += 1;
                  controllerGiaStop.text = currentMass.toStringAsFixed(2);
                }
              },
              child: nutBam(Alignment.centerRight, Icons.add,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
        ),
      ),
    );
  }

  Expanded btnKhoiLuong({TextStyle style = kText16Normal}) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: kGrey, width: 0.5),
          ),
        ),
        height: getProportionateScreenHeight(40),
        child: TextField(
          textAlign: TextAlign.center,
          controller: controllerKL,
          onChanged: (value) {
            setState(() {});
          },
          style: controllerKL.text.isNotEmpty
              ? (money / 91100 > double.parse(controllerKL.text)
                  ? kText16Normal.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)
                  : kTextRed16Normal)
              : kText16Normal.copyWith(
                  color: Theme.of(context).colorScheme.onBackground),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'^\d+')),
          ],
          decoration: InputDecoration(
            hintText: 'KL',
            prefixIcon: GestureDetector(
              onTap: () {
                if (controllerKL.text.isEmpty) {
                  double currentMass = 0;
                  controllerKL.text = (currentMass).toStringAsFixed(0);
                } else {
                  double currentMass = double.parse(controllerKL.text);
                  if (currentMass == 0) {
                    currentMass = currentMass;
                  } else if (currentMass >= 200 && currentMass > 0) {
                    currentMass -= 100;
                  } else if (currentMass < 200 && currentMass > 0) {
                    currentMass -= 1;
                  }
                  controllerKL.text = currentMass.toStringAsFixed(0);
                }
                setState(() {});
              },
              child: nutBam(
                Alignment.centerLeft,
                Icons.remove,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                if (controllerKL.text.isEmpty) {
                  double currentMass = 100;
                  controllerKL.text = (currentMass).toStringAsFixed(0);
                } else {
                  double currentMass = double.parse(controllerKL.text);
                  if (currentMass < 100) {
                    currentMass += 1;
                  } else if (currentMass >= 100) {
                    currentMass += 100;
                  }
                  controllerKL.text = currentMass.toStringAsFixed(0);
                }
                setState(() {});
              },
              child: nutBam(
                Alignment.centerRight,
                Icons.add,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.orange,
                width: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded btnGiaKhongDuocDat() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.5, color: kGrey))),
        height: getProportionateScreenHeight(40),
        child: TextField(
          textAlign: TextAlign.center,
          enabled: false,
          style: const TextStyle(color: Colors.grey),
          decoration: InputDecoration(
            hintText: 'Giá đặt',
            hintStyle: const TextStyle(color: kGrey),
            prefixIcon:
                nutBam(Alignment.centerLeft, color: kGrey, Icons.remove),
            suffixIcon: nutBam(color: kGrey, Alignment.centerRight, Icons.add),
          ),
        ),
      ),
    );
  }

  Expanded btnGiaDat() {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: kGrey, width: 0.5),
          ),
        ),
        height: getProportionateScreenHeight(40),
        child: TextField(
          textAlign: TextAlign.center,
          controller: controllerGiaDat,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
          ),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintStyle: kTextGrey16Normal,
            hintText: 'Giá đặt',
            prefixIcon: GestureDetector(
              onTap: () {
                if (controllerGiaDat.text.isEmpty) {
                  double currentMass = price;
                  currentMass -= 1;
                  controllerGiaDat.text = (currentMass + 1).toStringAsFixed(2);
                } else {
                  double currentMass = double.parse(controllerGiaDat.text);
                  currentMass -= 1;
                  controllerGiaDat.text = currentMass.toStringAsFixed(2);
                }
              },
              child: nutBam(
                Alignment.centerLeft,
                Icons.remove,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                if (controllerGiaDat.text.isEmpty) {
                  double currentMass = price;
                  currentMass += 1;
                  controllerGiaDat.text = (currentMass - 1).toStringAsFixed(2);
                } else {
                  double currentMass = double.parse(controllerGiaDat.text);
                  currentMass += 1;
                  controllerGiaDat.text = currentMass.toStringAsFixed(2);
                }
              },
              child: nutBam(
                Alignment.centerRight,
                Icons.add,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container nutBam(AlignmentGeometry? alignment, IconData? icon,
      {Color color = kWhite}) {
    return Container(
      width: getProportionateScreenWidth(60),
      alignment: alignment,
      color: Colors.transparent,
      child: Icon(
        icon,
        size: kSizeIcons,
        color: color,
      ),
    );
  }

  GestureDetector buildGestureDetector(
      {void Function()? onTap, required Color color, required IconData icon}) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: getProportionateScreenWidth(30),
        height: getProportionateScreenHeight(30),
        child: Icon(
          icon,
          size: 18,
          color: color,
        ),
      ),
    );
  }

  void _selectedDate() async {
    final currentDate = DateTime.now();
    final defaultDate = currentDate.add(const Duration(days: 1));
    final selectedDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.red, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: defaultDate,
      firstDate: defaultDate,
      lastDate: currentDate.add(
        const Duration(days: 360),
      ),
    );

    if (selectedDate != null) {
      setState(() {
        departureDate = selectedDate;
      });
    }
  }

  void _selectedTime() async {
    final currentTime = TimeOfDay.now();
    final defaultTime = currentTime.replacing(
      hour: currentTime.hour,
      minute: (currentTime.minute + 30) % 60, // Đảm bảo phút không vượt quá 60
    );
    final selectedTime = await showTimePicker(
        context: context,
        initialTime: defaultTime,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Colors.red, // header background color
                onPrimary: Colors.white, // header text color
                onSurface: Colors.black, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red, // button text color
                ),
              ),
            ),
            child: child!,
          );
        });

    if (selectedTime != null) {
      setState(() {
        timesss = selectedTime;
      });
    }
  }

  Container moeCaiNut(
      {required List<bool> isSelectedS,
      required String text1,
      required String text2,
      double inputSizeBox = 0,
      double fontSize = 20}) {
    return Container(
      height: 30,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).appBarTheme.foregroundColor,
      ),
      child: Row(
        children: [
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isSelectedS[0] = true;
                isSelectedS[1] = false;
              });
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.blackPrimary.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  )
                ],
                color: isSelectedS[0]
                    ? AppColor.redPrimary
                    : Theme.of(context).appBarTheme.backgroundColor,
              ),
              child: Center(
                child: Text(
                  text1,
                  style: TextStyle(
                      color: isSelectedS[0]
                          ? kWhite
                          : Theme.of(context).colorScheme.onBackground,
                      fontSize: fontSize),
                ),
              ),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(6),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isSelectedS[0] = false;
                isSelectedS[1] = true;
              });
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColor.blackPrimary.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(4),
                color: isSelectedS[1]
                    ? AppColor.redPrimary
                    : Theme.of(context).appBarTheme.backgroundColor,
              ),
              child: Center(
                child: Text(
                  text2,
                  style: TextStyle(
                      color: isSelectedS[1]
                          ? kWhite
                          : Theme.of(context).colorScheme.onBackground,
                      fontSize: fontSize),
                ),
              ),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(inputSizeBox),
          ),
        ],
      ),
    );
  }
}
