import 'package:flutter/material.dart';

import '../../../../theme/constrants.dart';
import '../../../../other/help_func.dart';
import '../../../../theme/size_config.dart';

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
            padding: EdgeInsets.only(
                left: 12.0, top: getProportionateScreenHeight(6)),
            child: const Text(
              'Khớp lệnh theo thời gian',
              style: kTextGrey15Normal,
            ),
          ),
          Center(
            child: DataTable(
              horizontalMargin: 0.0,
              headingRowHeight: 30,
              dataRowMinHeight: getProportionateScreenHeight(30),
              dataRowMaxHeight: getProportionateScreenHeight(30),
              columnSpacing: 44.0,
              columns: [
                DataColumn(
                  label: Text(
                    'Thời gian',
                    style: kTextWhite14Bold.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'KL khớp',
                    style: kTextWhite14Bold.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Giá khớp',
                    style: kTextWhite14Bold.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                ),
                DataColumn(
                  label: TextButton(
                    child: !isSwap
                        ? const Text(
                            '+/-',
                            style: kTextWhite14Bold,
                          )
                        : const Text(
                            '%',
                            style: kTextWhite14Bold,
                          ),
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
                          style: kText15Normal.copyWith(
                              color:
                                  Theme.of(context).colorScheme.onBackground),
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
                          style: kText15Normal.copyWith(
                              color:
                                  Theme.of(context).colorScheme.onBackground),
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
                          style: kText15Normal.copyWith(
                              color:
                                  Theme.of(context).colorScheme.onBackground),
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
                                style: kText15Normal.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground),
                              ),
                            )
                          : Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.zero,
                              margin: const EdgeInsets.symmetric(vertical: 1),
                              height: getProportionateScreenHeight(26),
                              child: Text(
                                '${data[index].number.toString()}%',
                                style: kText15Normal.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                right: getProportionateScreenWidth(16),
                top: getProportionateScreenHeight(8)),
            width: SizeConfig.screenWidth,
            alignment: Alignment.bottomRight,
            child: const Text(
              'Xem thêm',
              style: kTextRed15Normal,
            ),
          )
        ],
      ),
    );
  }

  List<DataCell> getCells(List<dynamic> cells, double changePercent) {
    return cells.map((data) {
      if (data is double) {}

      return DataCell(Center(
        child: Text(
          data.toString(),
        ),
      ));
    }).toList();
  }
}
