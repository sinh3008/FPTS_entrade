import 'package:entrade_x/constrants.dart';
import 'package:entrade_x/size_config.dart';
import 'package:entrade_x/ui/screen/home/components/hots/transition_fees/form_selected_date.dart';
import 'package:flutter/material.dart';

class TransitionFees extends StatefulWidget {
  const TransitionFees({super.key});

  @override
  State<TransitionFees> createState() => _TransitionFeesState();
}

class _TransitionFeesState extends State<TransitionFees> {
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackBackgroundCustom,
      appBar: AppBar(
        backgroundColor: kGreyColorCustom,
        title: const Text('Lịch sử khớp lệnh'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              const FormSelectedDate(),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Container(
                width: SizeConfig.screenWidth * 1,
                color: Colors.orange,
                height: SizeConfig.screenHeight * 0.440,
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              moeCaiNut()
            ],
          ),
        ),
      ),
    );
  }

  Container moeCaiNut() {
    return Container(
      height: getProportionateScreenHeight(42),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          color: kGreyColorCustom, borderRadius: BorderRadius.circular(42)),
      child: ToggleButtons(
        fillColor: kGreyColorCustom,
        selectedBorderColor: kGreyColorCustom,
        disabledBorderColor: kGreyColorCustom,
        borderColor: kGreyColorCustom,
        splashColor: kGreyColorCustom,
        borderRadius: BorderRadius.circular(42),
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
            width: getProportionateScreenWidth(60),
            height: getProportionateScreenHeight(42),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(42),
              color: isSelected[0] ? Colors.green : kGreyColorCustom,
            ),
            child: const Center(
                child: Text(
              'Cơ sở',
              style: TextStyle(color: Colors.white),
            )),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: getProportionateScreenWidth(80),
            height: getProportionateScreenHeight(42),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(42),
              color: isSelected[1] ? Colors.green : kGreyColorCustom,
            ),
            child: const Center(
                child: Text(
              'Phái sinh',
              style: TextStyle(color: Colors.white),
            )),
          ),
        ],
      ),
    );
  }
}
