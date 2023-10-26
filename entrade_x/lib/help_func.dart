import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/dataka.dart';

String getFormattedDate(DateTime dt, {String pattern = 'dd/MM/yyyy'}) {
  return DateFormat(pattern).format(dt);
}

List<bool> isSelected = [true, false];
List<bool> isSelected2 = [true, false];
DateTime departureDate = DateTime.now().add(const Duration(days: 1));
TimeOfDay timesss = TimeOfDay.now().replacing(
  hour: TimeOfDay.now().hour,
  minute: (TimeOfDay.now().minute + 30) % 60, // Đảm bảo phút không vượt quá 60
);

List<double> calculatePercentages(List<DataKa> dataList) {
  List<double> percentages = [];

  for (var data in dataList) {
    if (data.number != 0) {
      double percentage = data.number / data.price;
      percentages.add(percentage);
    } else {
      percentages.add(0.0);
    }
  }

  return percentages;
}

List<double> calculatePercentages2(List<DataKa> dataList2) {
  List<double> percentages = [];

  for (var data in dataList2) {
    if (data.number != 0) {
      double percentage = data.number / data.price;
      percentages.add(percentage);
    } else {
      percentages.add(0.0);
    }
  }
  return percentages;
}

final List<double> percentages = calculatePercentages(dataList1);
final List<double> percentages2 = calculatePercentages(dataList2);
<<<<<<< HEAD


String formatCurrency(int amount) {
  final formatter = NumberFormat.currency(
    locale: 'vi_VN',
    symbol: '', // Để loại bỏ ký hiệu tiền tệ (VD: VNĐ)
  );
  return formatter.format(amount).replaceAll('.', ',');
}



class OrderTime {
  final String time;
  final String number;
  final double price;
  final double percent;

  OrderTime(
      {required this.time,
        required this.number,
        required this.price,
        required this.percent});
}
=======
>>>>>>> origin/main
