import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../blocs/conditional/conditional_bloc.dart';
import '../../../../constrants.dart';
import '../../../../help_func.dart';
import '../../../../models/dataka.dart';
import '../../../../size_config.dart';

class OrderMatching extends StatefulWidget {
  const OrderMatching({super.key});

  @override
  State<OrderMatching> createState() => _OrderMatchingState();
}

bool isSwap = false;

class _OrderMatchingState extends State<OrderMatching> {
  List<Widget> column = [
    const Text('Thời gian'),
    const Text('Khối lượng'),
    TextButton(onPressed: () {}, child: const Text('+/-'))
  ];

  List<OrderTime> data = [
    OrderTime(time: '09:00:00', number: "50", price: 92.20, percent: -0.50),
    OrderTime(time: '09:20:00', number: "1,00", price: 92.40, percent: 0.30),
    OrderTime(time: '09:40:00', number: "20", price: 92.00, percent: -0.10),
    OrderTime(time: '09:00:00', number: "10", price: 92.60, percent: 0.30),
    OrderTime(time: '09:00:00', number: "30", price: 92.80, percent: 0.20),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
            padding: EdgeInsets.only(left: 12.0, top: getProportionateScreenHeight(6)),
            child: const Text(
              'Khớp lệnh theo thời gian',
              style: kTextGrey16Normal,
            ),
          ),
          Center(
            child: DataTable(
              horizontalMargin: 8,
              headingRowHeight: 30,
              dataRowMinHeight: getProportionateScreenHeight(30),
              dataRowMaxHeight: getProportionateScreenHeight(34),
              columnSpacing: 46.0,
              columns: [
                const DataColumn(
                  label: Text('Thời gian'),
                ),
                const DataColumn(
                  label: Text('KL khớp'),
                ),
                const DataColumn(
                  label: Text('Giá khớp'),
                ),
                DataColumn(
                  label: TextButton(
                    child: !isSwap ? const Text('+/-', style: kTextWhite15Normal,) : const Text('%', style: kTextWhite15Normal,) ,
                    onPressed: () {
                      if (isSwap == false) {
                        setState(() {
                          isSwap = true;
                        });
                      } else if (isSwap == true) {
                        setState(() {
                          isSwap = false;
                        });
                      }
                    },
                  ),
                ),
              ],
              rows: List.generate(
                5, // Use the length of dataList
                (index) => DataRow(
                  cells: [
                    DataCell(
                      Container(
                        padding: EdgeInsets.zero,
                        margin: const EdgeInsets.symmetric(vertical: 1),
                        height: getProportionateScreenHeight(26),
                        child: Text(
                          data[index].time.toString(),
                          style: kTextWhite16Normal,
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.zero,
                        margin: const EdgeInsets.symmetric(vertical: 1),
                        height: getProportionateScreenHeight(26),
                        child: Text(
                          data[index].number.toString(),
                          style: kTextWhite16Normal,
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(vertical: 1),
                        height: getProportionateScreenHeight(26),
                        child: Text(
                          data[index].price.toString(),
                          style: kTextWhite16Normal,
                        ),
                      ),
                    ),
                    DataCell(
                      isSwap == false
                          ? Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.zero,
                              margin: const EdgeInsets.symmetric(vertical: 1),
                              height: getProportionateScreenHeight(26),
                              child: Text(
                                data[index].percent.toString(),
                                style: kTextWhite16Normal,
                              ),
                            )
                          : Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.zero,
                              margin: const EdgeInsets.symmetric(vertical: 1),
                              height: getProportionateScreenHeight(26),
                              child: Text(
                                '${data[index].number.toString()}%',
                                style: kTextWhite16Normal,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<DataCell> getCells(List<dynamic> cells, double changePercent) {
    return cells.map((data) {
      Color textColor = Theme.of(context).textTheme.bodyMedium!.color!;
      if (data is double) {
        textColor = changePercent == 0
            ? Colors.yellow
            : (changePercent < 0 ? Colors.red : Colors.green);
      }

      return DataCell(Center(
        child: Text(
          data.toString(),
        ),
      ));
    }).toList();
  }
}
