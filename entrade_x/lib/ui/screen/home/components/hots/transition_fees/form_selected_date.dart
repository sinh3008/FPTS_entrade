import 'package:flutter/material.dart';

import '../../../../../../theme/constrants.dart';
import '../../../../../../other/help_func.dart';
import '../../../../../../theme/size_config.dart';
import '../../../../../../other/toast.dart';

class FormSelectedDate extends StatefulWidget {
  const FormSelectedDate({super.key});

  @override
  State<FormSelectedDate> createState() => _FormSelectedDateState();
}

class _FormSelectedDateState extends State<FormSelectedDate> {
  DateTime? fromDate, toDate;
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(12),
        vertical: getProportionateScreenHeight(12),
      ),
      width: SizeConfig.screenWidth * 1,
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.foregroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          buildFromDate(_selectedFromDate),
          SizedBox(
            width: getProportionateScreenWidth(20),
          ),
          buildToDate(_selectedToDate),
        ],
      ),
    );
  }

  Expanded buildFromDate(void Function()? onTap) {
    return Expanded(
      child: SizedBox(
        width: SizeConfig.screenWidth * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: kGrey, width: 1))),
              child: TextField(
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onBackground),
                controller: fromDateController,
                onTap: onTap,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Từ ngày',
                  labelStyle: TextStyle(color: kGrey),
                  hintStyle: TextStyle(fontSize: 14),
                  suffixIcon: Icon(
                    Icons.calendar_month,
                    color: kGrey,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            const Text('Tổng KL khớp'),
            const Text(
              '-',
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Row(
              children: [
                const Text('Phí'),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.info_outline,
                    color: kGrey,
                  ),
                ),
              ],
            ),
            const Text(
              '-',
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildToDate(void Function()? onTap) {
    return Expanded(
      child: SizedBox(
        width: SizeConfig.screenWidth * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: kGrey, width: 1))),
              child: TextField(
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onBackground),
                controller: toDateController,
                autofocus: true,
                onTap: onTap,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Đến ngày',
                  labelStyle: TextStyle(color: kGrey),
                  hintStyle: TextStyle(fontSize: 14),
                  suffixIcon: Icon(
                    Icons.calendar_month,
                    color: kGrey,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            const Text('Tổng KL khớp'),
            const Text(
              '-',
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Row(
              children: [
                const Text('Phí'),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.info_outline,
                    color: kGrey,
                  ),
                ),
              ],
            ),
            const Text(
              '-',
            ),
          ],
        ),
      ),
    );
  }

  void _selectedFromDate() async {
    final fromDateSelected = await showDatePicker(
        context: context,
        initialDate: fromDate ?? DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(
          const Duration(days: 360),
        ),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: Theme.of(context)
                  .colorScheme
                  .onBackground, // Customize the primary color
              hintColor: Theme.of(context)
                  .colorScheme
                  .primary, // Customize the accent color
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!,
          );
        });

    if (fromDateSelected != null &&
        (toDate == null || fromDateSelected.isBefore(toDate!))) {
      setState(() {
        fromDate = fromDateSelected;
        fromDateController.text =
            getFormattedDate(fromDate!, pattern: 'dd/MM/yyyy');
      });
    } else {
      showToast('Khoảng thời gian không hợp lệ, vui lòng chọn lại!');
    }
  }

  void _selectedToDate() async {
    final toDateSelected = await showDatePicker(
      context: context,
      initialDate: toDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 360),
      ),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Theme.of(context)
                .colorScheme
                .onBackground, // Customize the primary color
            hintColor: Theme.of(context)
                .colorScheme
                .primary, // Customize the accent color
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (toDateSelected != null &&
        (fromDate == null || toDateSelected.isAfter(fromDate!))) {
      setState(() {
        toDate = toDateSelected;
        toDateController.text =
            getFormattedDate(toDate!, pattern: 'dd/MM/yyyy');
      });
    } else {
      showToast('Khoảng thời gian không hợp lệ, vui lòng chọn lại!');
    }
  }
}
