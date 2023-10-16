import 'package:flutter/material.dart';

import '../../../../../../constrants.dart';
import '../../../../../../help_func.dart';
import '../../../../../../size_config.dart';
import '../../../../../../toast.dart';

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
        color: kGreyColorCustom,
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
            TextField(
              autofocus: true,
              controller: fromDateController,
              // Sử dụng fromDateController ở đây
              onTap: onTap,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Từ ngày',
                labelStyle: TextStyle(color: kGrey),
                hintStyle: TextStyle(fontSize: 14, color: kWhite),
                suffixIcon: Icon(
                  Icons.calendar_month,
                  color: kGrey,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kGrey),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            const Text('Tổng KL khớp'),
            const Text(
              '-',
              style: TextStyle(color: kWhite),
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
              style: TextStyle(color: kWhite),
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
            TextField(
              controller: toDateController, // Sử dụng toDateController ở đây
              onTap: onTap,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Đến ngày',
                labelStyle: TextStyle(color: kGrey),
                hintStyle: TextStyle(fontSize: 14, color: kWhite),
                suffixIcon: Icon(
                  Icons.calendar_month,
                  color: kGrey,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kGrey),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            const Text('Tổng KL khớp'),
            const Text(
              '-',
              style: TextStyle(color: kWhite),
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
              style: TextStyle(color: kWhite),
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
    );

    if (fromDateSelected != null && (toDate == null || fromDateSelected.isBefore(toDate!))) {
      setState(() {
        fromDate = fromDateSelected;
        fromDateController.text = getFormattedDate(fromDate!, pattern: 'dd/MM/yyyy');
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
    );

    if (toDateSelected != null && (fromDate == null || toDateSelected.isAfter(fromDate!))) {
      setState(() {
        toDate = toDateSelected;
        toDateController.text = getFormattedDate(toDate!, pattern: 'dd/MM/yyyy');
      });
    } else {
      showToast('Khoảng thời gian không hợp lệ, vui lòng chọn lại!');
    }
  }

}
