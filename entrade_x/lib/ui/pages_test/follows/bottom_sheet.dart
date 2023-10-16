import 'dart:core';
import 'package:entrade_x/help_func.dart';
import 'package:entrade_x/ui/components/circle_k.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  double price1 = 0;

  double price = 0;
  double priceStop = 0;
  int mass = 0;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.48,
      minChildSize: 0.48,
      maxChildSize: 0.58,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xff1c1c1c),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: BlocBuilder<ConditionalBloc, ConditionalState>(
            builder: (context, state) {
              if (state is ConditionalFitSuccessState) {
                price1 = state.priceFit;
                price = state.priceFit;
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Sức mua',
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(10),
                              ),
                              const Text(
                                '0',
                                style: TextStyle(
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
                                color: Colors.red,
                                onClicked: () {},
                              )
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(12)),
                                  height: 20,
                                  width: 150,
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
                                  Icons.settings,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Khi giá',
                                  style: TextStyle(fontSize: 14, color: kWhite),
                                ),
                                moeCaiNut(),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: getProportionateScreenWidth(30),
                                      height: getProportionateScreenHeight(30),
                                      child: Center(
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              price1--;
                                            });
                                          },
                                          child: const Icon(
                                            Icons.minimize,
                                            size: 18,
                                            color: kWhite,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.orange,
                                      width: 120,
                                      height: 40,
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        controller: _controller1,
                                        enabled: false,
                                        // Không cho phép chỉnh sửa.
                                        decoration: const InputDecoration(
                                            // hintText: _controller1.text.isEmpty
                                            //     ? 'Giá Stop'
                                            //     : _controller1.text,
                                            hintText: "Giá STOP",
                                            hintStyle:
                                                TextStyle(color: kWhite)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(30),
                                      height: getProportionateScreenHeight(30),
                                      child: Center(
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _controller1.text;
                                            });
                                          },
                                          child: const Icon(
                                            Icons.add,
                                            size: 18,
                                            color: kWhite,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: SizeConfig.screenWidth,
                                  height: 0.5,
                                  color: kGrey,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Kích hoạt',
                                      style: TextStyle(
                                          fontSize: 14, color: kWhite),
                                    ),
                                    Row(
                                      children: [
                                        moeCaiNut2(),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Expanded(
                                  child: Center(
                                child: Text(
                                  'Ký quỹ 100%',
                                  style: TextStyle(color: kWhite),
                                ),
                              )),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              isSelected2[0]
                                  ? Expanded(
                                child: SizedBox(
                                  height: 40,
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    readOnly: true,
                                    controller: _controller1,
                                    style: const TextStyle(
                                        color: Colors.white),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      prefixIcon: GestureDetector(
                                        onTap: () {
                                          int currentMass = int.tryParse(
                                              _controller1.text) ??
                                              0;
                                          currentMass -= 1;
                                          _controller1.text =
                                              currentMass.toString();
                                        },
                                        child: const Icon(
                                          Icons.minimize,
                                          size: 18,
                                          color: kWhite,
                                        ),
                                      ),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          int currentMass = int.tryParse(
                                              _controller1.text) ??
                                              0;
                                          currentMass += 1;
                                          _controller1.text =
                                              currentMass.toString();
                                        },
                                        child: const Icon(
                                          Icons.add,
                                          size: 18,
                                          color: kWhite,
                                        ),
                                      ),
                                      border: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                          kGrey, // Màu của border bottom
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
                                    controller: controllerDemo,
                                    textAlign: TextAlign.center,
                                    readOnly: true,
                                    style: const TextStyle(
                                        color: Colors.grey),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      prefixIcon: GestureDetector(
                                        onTap: () {},
                                        child: const Icon(
                                          Icons.minimize,
                                          size: 18,
                                          color: kGrey,
                                        ),
                                      ),
                                      suffixIcon: GestureDetector(
                                        onTap: () {},
                                        child: const Icon(
                                          Icons.add,
                                          size: 18,
                                          color: kGrey,
                                        ),
                                      ),
                                      border: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                          kGrey, // Màu của border bottom
                                          width:
                                          0.5, // Độ rộng của border bottom
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 40,
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    readOnly: true,
                                    controller: massController,
                                    style: const TextStyle(color: Colors.white),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      prefixIcon: GestureDetector(
                                        onTap: () {
                                          int currentMass = int.tryParse(
                                                  massController.text) ??
                                              0;
                                          if (currentMass > 100) {
                                            currentMass -= 100;
                                          } else {
                                            currentMass -= 1;
                                          }
                                          massController.text =
                                              currentMass.toString();
                                        },
                                        child: const Icon(
                                          Icons.minimize,
                                          size: 18,
                                          color: kWhite,
                                        ),
                                      ),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          int currentMass = int.tryParse(
                                                  massController.text) ??
                                              0;
                                          currentMass += 100;
                                          massController.text =
                                              currentMass.toString();
                                        },
                                        child: const Icon(
                                          Icons.add,
                                          size: 18,
                                          color: kWhite,
                                        ),
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      child: Row(
                        children: [
                          SizedBox(
                              width: getProportionateScreenWidth(60),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        timesss.format(context),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(10),
                                      ),
                                      const Icon(Icons.access_time_outlined),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          getProportionateScreenWidth(6)),
                                  height: 0.5,
                                  color: kGrey,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: _selectedDate,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          getFormattedDate(departureDate,
                                              pattern: 'dd/MM/yyyy'),
                                          style: const TextStyle(
                                              color: Colors.white)),
                                      SizedBox(
                                        width: getProportionateScreenWidth(10),
                                      ),
                                      const Icon(Icons.calendar_month_outlined),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          getProportionateScreenWidth(6)),
                                  height: 0.5,
                                  color: kGrey,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildCircleK(
                            borderRadius: BorderRadius.circular(10),
                            shape: BoxShape.rectangle,
                            padding: const EdgeInsets.all(6),
                            width: SizeConfig.screenWidth * 0.4,
                            demo: const Column(
                              children: [
                                Text(
                                  'MUA',
                                  style: TextStyle(color: kWhite, fontSize: 12),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(color: kWhite, fontSize: 12),
                                ),
                              ],
                            ),
                            color: Colors.green,
                            onClicked: () {},
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(20),
                          ),
                          buildCircleK(
                            borderRadius: BorderRadius.circular(10),
                            shape: BoxShape.rectangle,
                            padding: const EdgeInsets.all(6),
                            width: SizeConfig.screenWidth * 0.4,
                            demo: const Column(
                              children: [
                                Text(
                                  'BÁN',
                                  style: TextStyle(color: kWhite, fontSize: 12),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(color: kWhite, fontSize: 12),
                                ),
                              ],
                            ),
                            color: Colors.red,
                            onClicked: () {},
                          ),
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
        );
      },
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
        color: const Color(0xff1c1c1c),
      ),
      child: ToggleButtons(
        fillColor: kGreyColorCustom,
        selectedBorderColor: const Color(0xff1c1c1c),
        disabledBorderColor: kGreyColorCustom,
        borderColor: const Color(0xff1c1c1c),
        splashColor: kGreyColorCustom,
        borderRadius: BorderRadius.circular(8),
        onPressed: (int index) {
          setState(() {
            for (var i = 0; i < isSelected.length; i++) {
              isSelected[i] = (i == index);
            }
          });
        },
        isSelected: isSelected,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: isSelected[0] ? Colors.red : kGreyColorCustom,
            ),
            child: const Center(
                child: Text(
              '>',
              style: TextStyle(color: Colors.white),
            )),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: isSelected[1] ? Colors.red : kGreyColorCustom,
            ),
            child: const Center(
                child: Text(
              '<',
              style: TextStyle(color: Colors.white),
            )),
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
        color: const Color(0xff1c1c1c),
      ),
      child: ToggleButtons(
        fillColor: kGreyColorCustom,
        selectedBorderColor: const Color(0xff1c1c1c),
        disabledBorderColor: kGreyColorCustom,
        borderColor: const Color(0xff1c1c1c),
        splashColor: kGreyColorCustom,
        borderRadius: BorderRadius.circular(8),
        onPressed: (int index) {
          setState(() {
            for (var i = 0; i < isSelected2.length; i++) {
              isSelected2[i] = (i == index);
            }
          });
        },
        isSelected: isSelected2,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: isSelected2[0] ? Colors.red : kGreyColorCustom,
            ),
            child: const Center(
                child: Text(
              'LO',
              style: TextStyle(color: Colors.white),
            )),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: isSelected2[1] ? Colors.red : kGreyColorCustom,
            ),
            child: const Center(
                child: Text(
              'MP',
              style: TextStyle(color: Colors.white),
            )),
          ),
        ],
      ),
    );
  }
}
// state.priceFit.toString()
