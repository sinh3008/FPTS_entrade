import 'dart:core';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:entrade_x/blocs/conditional/conditional_bloc.dart';
import 'package:entrade_x/help_func.dart';
import 'package:entrade_x/ui/components/circle_k.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../constrants.dart';
import '../../../../size_config.dart';

// ignore: must_be_immutable
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
  static double money = 999999999;
  double price = 42.25;

  double quantity = 0;
  double setPrice = 0;

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
      child: DraggableScrollableSheet(
        initialChildSize: 0.45,
        minChildSize: 0.42,
        maxChildSize: 0.8,
        builder: (BuildContext context, ScrollController scrollController) {
          return SingleChildScrollView(
            child: Container(
                padding:
                    EdgeInsets.only(bottom: getProportionateScreenHeight(8)),
                decoration: const BoxDecoration(
                  color: kBgBottomSheet,
                  borderRadius: BorderRadius.only(),
                ),
                child: BlocBuilder<ConditionalBloc, ConditionalState>(
                  builder: (context, state) {
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          width:
                                              getProportionateScreenWidth(18),
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          height:
                                              getProportionateScreenHeight(18),
                                          padding: EdgeInsets.zero,
                                          demo: const Icon(
                                            Icons.add,
                                            size: 18,
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
                                        GestureDetector(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            decoration: BoxDecoration(
                                                color: kRedButtonBG,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            height: 26,
                                            child: const Center(
                                              child: Text(
                                                'Lệnh điều kiện',
                                                style: kTextWhite15Normal,
                                              ),
                                            ),
                                          ),
                                        ),
                                        sizeBoxWidth(10),
                                        SizedBox(
                                          width:
                                              getProportionateScreenWidth(10),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                    padding: EdgeInsets.symmetric(
                                        vertical:
                                            getProportionateScreenHeight(3)),
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
                                          child: buildCircleK(
                                            margin:
                                                const EdgeInsets.only(left: 50),
                                            padding: EdgeInsets.zero,
                                            height:
                                                getProportionateScreenHeight(
                                                    26),
                                            width:
                                                getProportionateScreenWidth(70),
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            demo: const Center(
                                              child: Text(
                                                'Ký quỹ 100%',
                                                style: kTextWhite15Normal,
                                              ),
                                            ),
                                            color: const Color.fromARGB(
                                                255, 39, 41, 44),
                                            onClicked: () {},
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  sizeBoxHeight(6),
                                  Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 3),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        if (isSelected2[0])
                                          btnGiaDat()
                                        else
                                          btnGiaKhongDuocDat(),
                                        SizedBox(
                                          width:
                                              getProportionateScreenWidth(20),
                                        ),
                                        btnKhoiLuong(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              sizeBoxHeight(8),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Row(
                                      children: [
                                        SizedBox(
                                          width:
                                              getProportionateScreenWidth(60),
                                          child: const Text(
                                            'Hết hạn',
                                            style: TextStyle(color: kWhite),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: buildCircleK(
                                        borderRadius: BorderRadius.circular(4),
                                        shape: BoxShape.rectangle,
                                        padding: const EdgeInsets.only(top: 6),
                                        width: SizeConfig.screenWidth * 0.46,
                                        demo: const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'MUA',
                                              style: TextStyle(color: kWhite),
                                            ),
                                            Text(
                                              '0',
                                              style: TextStyle(color: kWhite),
                                            ),
                                          ],
                                        ),
                                        color: Colors.green,
                                        onClicked: () {
                                          // context
                                          //     .read<ConditionalBloc>()
                                          //     .add(UpdateBuyEvent(1));
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(16),
                                    ),
                                    Expanded(
                                      child: buildCircleK(
                                        borderRadius: BorderRadius.circular(4),
                                        shape: BoxShape.rectangle,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 6),
                                        width: SizeConfig.screenWidth * 0.46,
                                        demo: const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                  },
                )),
          );
        },
      ),
    );
  }

  Expanded btnDate() {
    return Expanded(
      child: Column(
        children: [
          GestureDetector(
            onTap: _selectedDate,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(getFormattedDate(departureDate, pattern: 'dd/MM/yyyy'),
                    style: const TextStyle(color: Colors.white)),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                const Icon(Icons.calendar_month_outlined),
              ],
            ),
          ),
          Container(
            width: SizeConfig.screenWidth * 0.5,
            height: 0.5,
            color: kGrey,
          )
        ],
      ),
    );
  }

  Expanded btnTime(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          GestureDetector(
            onTap: _selectedTime,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  timesss.format(context),
                  style: const TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                const Icon(Icons.access_time_outlined),
              ],
            ),
          ),
          Container(
            width: SizeConfig.screenWidth * 0.4,
            height: 0.5,
            color: kGrey,
          )
        ],
      ),
    );
  }

  Expanded btnGiaSTOP() {
    return Expanded(
      child: SizedBox(
        height: getProportionateScreenHeight(40),
        child: TextField(
          textAlign: TextAlign.center,
          controller: controllerGiaStop,
          style: kTextWhite15Normal,
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
              child: nutBam(Alignment.centerLeft, Icons.remove),
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
              child: nutBam(Alignment.centerRight, Icons.add),
            ),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: kGrey,
                width: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded btnKhoiLuong({TextStyle style = kTextWhite16Normal}) {
    return Expanded(
      child: SizedBox(
        height: getProportionateScreenHeight(40),
        child: TextField(
          textAlign: TextAlign.center,
          controller: controllerKL,
          style: style,
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
                print(controllerKL.text);
              },
              child: nutBam(Alignment.centerLeft, Icons.remove),
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
              },
              child: nutBam(Alignment.centerRight, Icons.add),
            ),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: kGrey,
                // Màu của border bottom
                width: 0.5, // Độ rộng của border bottom
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded btnGiaKhongDuocDat() {
    return Expanded(
      child: SizedBox(
        height: getProportionateScreenHeight(40),
        child: TextField(
          textAlign: TextAlign.center,
          controller: controllerGiaDat,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Giá đặt',
            prefixIcon:
                nutBam(Alignment.centerLeft, color: kGrey, Icons.remove),
            suffixIcon: nutBam(color: kGrey, Alignment.centerRight, Icons.add),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: kGrey,
                // Màu của border bottom
                width: 0.5, // Độ rộng của border bottom
              ),
            ),
          ),
        ),
      ),
    );
  }

  void updateSetPrice(double change) {
    double currentPrice = controllerGiaDat.text.isEmpty
        ? price
        : double.parse(controllerGiaDat.text);

    if (currentPrice == 0 && change < 0) {
      return;
    }

    currentPrice += change;
    controllerGiaDat.text = currentPrice.toStringAsFixed(2);
  }

  GestureDetector buildPriceButton(
      AlignmentGeometry alignment, double change, IconData icon) {
    return GestureDetector(
      onTap: () {
        updateSetPrice(change);
      },
      child: nutBam(alignment, icon),
    );
  }

  Expanded btnGiaDat() {
    return Expanded(
      child: SizedBox(
        height: getProportionateScreenHeight(40),
        child: TextField(
          textAlign: TextAlign.center,
          controller: controllerGiaDat,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintStyle: kTextGrey16Normal,
            hintText: 'Giá đặt',
            prefixIcon:
                buildPriceButton(Alignment.centerLeft, -1.0, Icons.remove),
            suffixIcon: buildPriceButton(Alignment.centerRight, 1.0, Icons.add),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: kGrey,
                // Màu của border bottom
                width: 0.5, // Độ rộng của border bottom
              ),
            ),
          ),
          onChanged: (value) {
            setPrice = double.parse(controllerGiaDat.text);
            print(setPrice);
          },
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
    );

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
        color: const Color(0xff202123),
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
                color: isSelectedS[0]
                    ? const Color(0xffd34343)
                    : const Color.fromARGB(255, 39, 41, 44),
              ),
              child: Center(
                child: Text(
                  text1,
                  style: TextStyle(color: Colors.white, fontSize: fontSize),
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
                borderRadius: BorderRadius.circular(4),
                color: isSelectedS[1]
                    ? const Color(0xffd34343)
                    : const Color.fromARGB(255, 39, 41, 44),
              ),
              child: Center(
                child: Text(
                  text2,
                  style: TextStyle(color: Colors.white, fontSize: fontSize),
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
