import 'package:flutter/material.dart';

import '../theme/constrants.dart';

List<String> tabTitles = [
  'Bước giá',
  'Khớp lệnh',
  'Lô lẻ',
  'Sự kiện',
];

List<Widget> tabs = tabTitles.map((title) {
  return Text(
    title,
    style: kLabelChartStyle,
  );
}).toList();