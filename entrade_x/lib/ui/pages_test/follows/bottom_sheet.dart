import 'dart:core';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:entrade_x/help_func.dart';
import 'package:entrade_x/ui/components/circle_k.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../blocs/conditional/conditional_bloc.dart';
import '../../../constrants.dart';
import '../../../size_config.dart';

// ignore: must_be_immutable
class CustomerBottomSheet extends StatefulWidget {
  const CustomerBottomSheet({Key? key}) : super(key: key);

  @override
  State<CustomerBottomSheet> createState() => _CustomerBottomSheetState();
}

class _CustomerBottomSheetState extends State<CustomerBottomSheet> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  TextEditingController massController = TextEditingController();
  TextEditingController controllerDemo = TextEditingController(text: "Giá đặt");

  int mass = 0;
  int money = 1;
  double price = 42.45;

  String formatCurrency(int amount) {
    final formatter = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: '', // Để loại bỏ ký hiệu tiền tệ (VD: VNĐ)
    );
    return formatter.format(amount).replaceAll('.', ',');
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
              padding: const EdgeInsets.only(bottom: 10),
              decoration: const BoxDecoration(
                color: Color(0xff202123),
                borderRadius: BorderRadius.only(),
              ),
              child: BlocBuilder<ConditionalBloc, ConditionalState>(
                builder: (context, state) {
                  if (state is ConditionalFitSuccessState) {
                    if (state.priceFit != 0.0) {
                      _controller1.text = state.priceFit.toString();
                      _controller2.text = state.priceFit.toString();
                    } else {}
                    return Column(
                      children: [
                        Container(
                          width: SizeConfig.screenWidth,
                          height: 0.5,
                          color: Colors.white.withOpacity(0.2),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Column(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.only(bottom: 8, top: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          'Sức mua:',
                                          style: TextStyle(),
                                        ),
                                        SizedBox(
                                          width: getProportionateScreenWidth(4),
                                        ),
                                        AutoSizeText(
                                          formatCurrency(money),
                                          maxLines: 2,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          width: getProportionateScreenWidth(6),
                                        ),
                                        buildCircleK(
                                          shape: BoxShape.rectangle,
                                          width: 20,
                                          borderRadius: BorderRadius.circular(2),
                                          height: 20,
                                          padding: EdgeInsets.zero,
                                          demo: const Icon(
                                            Icons.add,
                                            size: 18,
                                          ),
                                          color: const Color(0xffd34343),
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
                                                color: const Color(0xffd34343),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            height: 26,
                                            child: const Center(
                                              child: Text(
                                                'Lệnh điều kiện',
                                                style: TextStyle(color: kWhite),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: getProportionateScreenWidth(10),
                                        ),
                                        const Center(
                                          child: Icon(
                                            Icons.settings_outlined,
                                            color: Color(0xffd34343),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 3),
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
                                            style: TextStyle(color: kWhite),
                                          ),
                                          moeCaiNut(),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(20),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        height: 40,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          controller: _controller1,
                                          style: const TextStyle(
                                              color: Colors.orange),
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            hintText: 'Giá STOP',
                                            prefixIcon: GestureDetector(
                                              onTap: () {
                                                if (_controller1.text.isEmpty) {
                                                  double currentMass = 42.45;
                                                  currentMass -= 1;
                                                  _controller1.text =
                                                      (currentMass + 1)
                                                          .toString();
                                                } else {
                                                  double currentMass =
                                                      double.parse(
                                                          _controller1.text);
                                                  currentMass -= 1;
                                                  _controller1.text =
                                                      currentMass.toString();
                                                }
                                              },
                                              child: Container(
                                                color: Colors.transparent,
                                                child: const Icon(
                                                  Icons.minimize,
                                                  size: 20,
                                                  color: kWhite,
                                                ),
                                              ),
                                            ),
                                            suffixIcon: GestureDetector(
                                              onTap: () {
                                                if (_controller1.text.isEmpty) {
                                                  double currentMass = 42.45;
                                                  currentMass += 1;
                                                  _controller1.text =
                                                      (currentMass - 1)
                                                          .toString();
                                                } else {
                                                  double currentMass =
                                                      double.parse(
                                                          _controller1.text);
                                                  currentMass += 1;
                                                  _controller1.text =
                                                      currentMass.toString();
                                                }
                                              },
                                              child: Container(
                                                color: Colors.transparent,
                                                child: const Icon(
                                                  Icons.add,
                                                  size: 18,
                                                  color: kWhite,
                                                ),
                                              ),
                                            ),
                                            prefixIconConstraints:
                                                const BoxConstraints(
                                              minWidth: 26, // Độ rộng tối thiểu
                                              minHeight:
                                                  30, // Chiều cao tối thiểu
                                            ),

                                            // Thiết lập kích thước cho suffixIcon
                                            suffixIconConstraints:
                                                const BoxConstraints(
                                              minWidth: 26, // Độ rộng tối thiểu
                                              minHeight:
                                                  30, // Chiều cao tối thiểu
                                            ),
                                            border: const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: kGrey,
                                                // Màu của border bottom
                                                width:
                                                    0.5, // Độ rộng của border bottom
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(4),
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 3),
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
                                                style: TextStyle(color: kWhite),
                                              ),
                                              Row(
                                                children: [
                                                  moeCaiNut2(),
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
                                            height: 26,
                                            width: 70,
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            demo: const Center(
                                              child: Text(
                                                'Ký quỹ 100%',
                                                style: TextStyle(color: kWhite),
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
                                  Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 3),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        isSelected2[0]
                                            ? Expanded(
                                                child: SizedBox(
                                                  height: 40,
                                                  child: TextField(
                                                    // onTapOutside: ((event) {
                                                    //   FocusScope.of(context)
                                                    //       .unfocus();
                                                    // }),
                                                    textAlign: TextAlign.center,
                                                    controller: _controller2,
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      hintStyle: const TextStyle(
                                                          color: Colors.white),
                                                      hintText: 'Giá đặt',
                                                      prefixIcon: GestureDetector(
                                                        onTap: () {
                                                          if (_controller2
                                                              .text.isEmpty) {
                                                            double currentMass =
                                                                price;
                                                            currentMass -= 1;
                                                            _controller2.text =
                                                                (currentMass + 1)
                                                                    .toString();
                                                          } else {
                                                            double currentMass =
                                                                double.parse(
                                                                    _controller2
                                                                        .text);
                                                            currentMass -= 1;
                                                            _controller2.text =
                                                                currentMass
                                                                    .toString();
                                                          }
                                                        },
                                                        child: Container(
                                                          color:
                                                              Colors.transparent,
                                                          child: const Icon(
                                                            Icons.minimize,
                                                            size: 18,
                                                            color: kWhite,
                                                          ),
                                                        ),
                                                      ),
                                                      suffixIcon: GestureDetector(
                                                        onTap: () {
                                                          if (_controller2
                                                              .text.isEmpty) {
                                                            double currentMass =
                                                                price;
                                                            currentMass += 1;
                                                            _controller2.text =
                                                                (currentMass - 1)
                                                                    .toString();
                                                          } else {
                                                            double currentMass =
                                                                double.parse(
                                                                    _controller2
                                                                        .text);
                                                            currentMass += 1;
                                                            _controller2.text =
                                                                currentMass
                                                                    .toString();
                                                          }
                                                        },
                                                        child: Container(
                                                          color:
                                                              Colors.transparent,
                                                          child: const Icon(
                                                            Icons.add,
                                                            size: 18,
                                                            color: kWhite,
                                                          ),
                                                        ),
                                                      ),
                                                      prefixIconConstraints:
                                                          const BoxConstraints(
                                                        minWidth: 26,
                                                        // Độ rộng tối thiểu
                                                        minHeight:
                                                            30, // Chiều cao tối thiểu
                                                      ),

                                                      // Thiết lập kích thước cho suffixIcon
                                                      suffixIconConstraints:
                                                          const BoxConstraints(
                                                        minWidth: 26,
                                                        // Độ rộng tối thiểu
                                                        minHeight:
                                                            30, // Chiều cao tối thiểu
                                                      ),
                                                      border:
                                                          const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: kGrey,
                                                          // Màu của border bottom
                                                          width:
                                                              0.5, // Độ rộng của border bottom
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Expanded(
                                                child: SizedBox(
                                                  height: 40,
                                                  child: TextField(
                                                    textAlign: TextAlign.center,
                                                    controller: _controller2,
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      hintText: 'Giá đặt',
                                                      prefixIcon: Container(
                                                        color: Colors.transparent,
                                                        child: const Icon(
                                                          Icons.minimize,
                                                          size: 18,
                                                          color: kGrey,
                                                        ),
                                                      ),
                                                      suffixIcon: Container(
                                                        color: Colors.transparent,
                                                        child: const Icon(
                                                          Icons.add,
                                                          size: 18,
                                                          color: kGrey,
                                                        ),
                                                      ),
                                                      prefixIconConstraints:
                                                          const BoxConstraints(
                                                        minWidth: 26,
                                                        // Độ rộng tối thiểu
                                                        minHeight:
                                                            30, // Chiều cao tối thiểu
                                                      ),

                                                      // Thiết lập kích thước cho suffixIcon
                                                      suffixIconConstraints:
                                                          const BoxConstraints(
                                                        minWidth: 26,
                                                        // Độ rộng tối thiểu
                                                        minHeight:
                                                            30, // Chiều cao tối thiểu
                                                      ),
                                                      border:
                                                          const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: kGrey,
                                                          // Màu của border bottom
                                                          width:
                                                              0.5, // Độ rộng của border bottom
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                        SizedBox(
                                          width: getProportionateScreenWidth(20),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            height: 40,
                                            child: TextField(
                                              textAlign: TextAlign.center,
                                              controller: massController,
                                              style: const TextStyle(
                                                  color: Colors.white),
                                              keyboardType: TextInputType.number,
                                              decoration: InputDecoration(
                                                hintText: 'Khối lượng',
                                                prefixIconConstraints:
                                                    const BoxConstraints(
                                                  minWidth: 26,
                                                  // Độ rộng tối thiểu
                                                  minHeight:
                                                      30, // Chiều cao tối thiểu
                                                ),

                                                // Thiết lập kích thước cho suffixIcon
                                                suffixIconConstraints:
                                                    const BoxConstraints(
                                                  minWidth: 26,
                                                  // Độ rộng tối thiểu
                                                  minHeight:
                                                      30, // Chiều cao tối thiểu
                                                ),
                                                prefixIcon: GestureDetector(
                                                  onTap: () {
                                                    int currentMass =
                                                        int.tryParse(
                                                                massController
                                                                    .text) ??
                                                            0;
                                                    if (currentMass > 100) {
                                                      currentMass -= 100;
                                                    } else {
                                                      currentMass -= 1;
                                                    }
                                                    massController.text =
                                                        currentMass.toString();
                                                  },
                                                  child: Container(
                                                    color: Colors.transparent,
                                                    child: const Icon(
                                                      Icons.minimize,
                                                      size: 18,
                                                      color: kWhite,
                                                    ),
                                                  ),
                                                ),
                                                suffixIcon: GestureDetector(
                                                  onTap: () {
                                                    int currentMass =
                                                        int.tryParse(
                                                                massController
                                                                    .text) ??
                                                            0;
                                                    currentMass += 100;
                                                    massController.text =
                                                        currentMass.toString();
                                                  },
                                                  child: Container(
                                                    color: Colors.transparent,
                                                    child: const Icon(
                                                      Icons.add,
                                                      size: 18,
                                                      color: kWhite,
                                                    ),
                                                  ),
                                                ),
                                                border:
                                                    const UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: kGrey,
                                                    // Màu của border bottom
                                                    width:
                                                        0.5, // Độ rộng của border bottom
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(4),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 3),
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
                                            )),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              GestureDetector(
                                                onTap: _selectedTime,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      timesss.format(context),
                                                      style: const TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          getProportionateScreenWidth(
                                                              10),
                                                    ),
                                                    const Icon(Icons
                                                        .access_time_outlined),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width:
                                                    SizeConfig.screenWidth * 0.4,
                                                height: 0.5,
                                                color: kGrey,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                                    SizedBox(
                                      width: getProportionateScreenWidth(20),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: _selectedDate,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                    getFormattedDate(
                                                        departureDate,
                                                        pattern: 'dd/MM/yyyy'),
                                                    style: const TextStyle(
                                                        color: Colors.white)),
                                                SizedBox(
                                                  width:
                                                      getProportionateScreenWidth(
                                                          10),
                                                ),
                                                const Icon(Icons
                                                    .calendar_month_outlined),
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
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(4),
                              ),
                              (_controller1.text ?? '') != '' &&
                                      (_controller2.text ?? '') != '' &&
                                      (massController.text ?? '') != ''
                                  ? Container(
                                      width: SizeConfig.screenWidth,
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 3),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: buildCircleK(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              shape: BoxShape.rectangle,
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 6),
                                              width:
                                                  SizeConfig.screenWidth * 0.46,
                                              demo: const Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'MUA',
                                                    style:
                                                        TextStyle(color: kWhite),
                                                  ),
                                                  Text(
                                                    '0',
                                                    style:
                                                        TextStyle(color: kWhite),
                                                  ),
                                                ],
                                              ),
                                              color: Colors.green,
                                              onClicked: () {},
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                getProportionateScreenWidth(16),
                                          ),
                                          Expanded(
                                            child: buildCircleK(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              shape: BoxShape.rectangle,
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 6),
                                              width:
                                                  SizeConfig.screenWidth * 0.46,
                                              demo: const Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'BÁN',
                                                    style:
                                                        TextStyle(color: kWhite),
                                                  ),
                                                  Text(
                                                    '0',
                                                    style:
                                                        TextStyle(color: kWhite),
                                                  ),
                                                ],
                                              ),
                                              color: const Color(0xffd34343),
                                              onClicked: () {},
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      width: SizeConfig.screenWidth,
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 3),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: buildCircleK(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              shape: BoxShape.rectangle,
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 6),
                                              width:
                                                  SizeConfig.screenWidth * 0.46,
                                              demo: const Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'MUA',
                                                    style:
                                                        TextStyle(color: kWhite),
                                                  ),
                                                  Text(
                                                    '0',
                                                    style:
                                                        TextStyle(color: kWhite),
                                                  ),
                                                ],
                                              ),
                                              color:
                                                  Colors.green.withOpacity(0.5),
                                              onClicked: () {},
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                getProportionateScreenWidth(16),
                                          ),
                                          Expanded(
                                            child: buildCircleK(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              shape: BoxShape.rectangle,
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 6),
                                              width:
                                                  SizeConfig.screenWidth * 0.46,
                                              demo: const Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'BÁN',
                                                    style:
                                                        TextStyle(color: kWhite),
                                                  ),
                                                  Text(
                                                    '0',
                                                    style:
                                                        TextStyle(color: kWhite),
                                                  ),
                                                ],
                                              ),
                                              color: const Color(0xffd34343)
                                                  .withOpacity(0.5),
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
                    return const Center(
                      child: Text('Demo'),
                    );
                  }
                },
              ),
            ),
          );
        },
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
      hour: currentTime.hour + 1,
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

  Container moeCaiNut() {
    return Container(
      height: 40,
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
                isSelected[0] = true;
                isSelected[1] = false;
              });
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: isSelected[0]
                    ? const Color(0xffd34343)
                    : const Color.fromARGB(255, 39, 41, 44),
              ),
              child: const Center(
                child: Text(
                  '≥',
                  style: TextStyle(color: Colors.white, fontSize: 20),
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
                isSelected[0] = false;
                isSelected[1] = true;
              });
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: isSelected[1]
                    ? const Color(0xffd34343)
                    : const Color.fromARGB(255, 39, 41, 44),
              ),
              child: const Center(
                child: Text(
                  '≤',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container moeCaiNut2() {
    return Container(
      height: 40,
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
                isSelected2[0] = true;
                isSelected2[1] = false;
              });
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: isSelected2[0]
                    ? const Color(0xffd34343)
                    : const Color.fromARGB(255, 39, 41, 44),
              ),
              child: const Center(
                child: Text(
                  'LO',
                  style: TextStyle(color: Colors.white),
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
                isSelected2[0] = false;
                isSelected2[1] = true;
              });
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: isSelected2[1]
                    ? const Color(0xffd34343)
                    : const Color.fromARGB(255, 39, 41, 44),
              ),
              child: const Center(
                child: Text(
                  'MP',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
        ],
      ),
    );
  }
}
// state.priceFit.toString()