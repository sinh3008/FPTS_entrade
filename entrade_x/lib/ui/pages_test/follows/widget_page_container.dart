import 'package:entrade_x/blocs/conditional/conditional_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/dataka.dart';
import '../../../size_config.dart';

class PageContainer extends StatelessWidget {
  const PageContainer({
    super.key,
    required this.percentages,
    required this.percentages2,
  });

  final List<double> percentages;
  final List<double> percentages2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(0.0),
          child: DataTable(
            headingRowHeight: 0,
            dataRowMinHeight: 30,
            dataRowMaxHeight: 30,
            columnSpacing: 0.0,
            columns: [
              DataColumn(label: Container()),
              DataColumn(label: Container()),
            ],
            rows: List.generate(
              3, // Use the length of dataList
              (index) => DataRow(
                cells: [
                  DataCell(
                    Container(
                      padding: EdgeInsets.zero,
                      margin: const EdgeInsets.symmetric(vertical: 1),
                      height: 26,
                      width: SizeConfig.screenWidth * 0.42,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.transparent,
                            // Màu bên trái
                            Colors.green.withOpacity(0.4),
                            // Màu bên phải
                          ],
                          stops: [
                            1.0 - percentages[index],
                            // Điểm dừng bên trái
                            1.0 - percentages[index],
                            // Điểm dừng bên phải
                          ],
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            dataList1[index].price.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () => context.read<ConditionalBloc>().add(
                                ClickFitPriceEvent(dataList1[index].number)),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                dataList1[index].number.toString(),
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 1),
                      height: 26,
                      width: SizeConfig.screenWidth * 0.42,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Colors.transparent,
                            // Màu bên trái
                            Colors.red.withOpacity(0.4),
                            // Màu bên phải
                          ],
                          stops: [
                            1.0 - percentages2[index],
                            // Điểm dừng bên trái
                            1.0 - percentages2[index],
                            // Điểm dừng bên phải
                          ],
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => context.read<ConditionalBloc>().add(
                                ClickFitPriceEvent(dataList2[index].number)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                dataList2[index].number.toString(),
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              dataList2[index].price.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: SizeConfig.screenWidth * 0.9,
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                      color: Colors.green.withOpacity(0.4),
                    ),
                  )),
              Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      color: Colors.red.withOpacity(0.4),
                    ),
                    height: 10,
                  )),
            ],
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(8),
        ),
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Dư mua '),
                  Text(
                    '9.6k',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Dư bán '),
                  Text(style: TextStyle(color: Colors.white), '14k'),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(8),
        ),
        Container(
          margin:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          width: SizeConfig.screenWidth,
          height: 0.5,
          color: Colors.grey,
        ),
        SizedBox(
          height: getProportionateScreenHeight(8),
        ),
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text('Sàn')),
                  Expanded(
                      child: Text(
                    '38.95',
                    style: TextStyle(color: Colors.blue),
                  )),
                  Expanded(child: Text('TC')),
                  Expanded(
                      child: Text(
                    '38.95',
                    style: TextStyle(color: Colors.red),
                  )),
                  Expanded(child: Text('Trần')),
                  Expanded(
                      child: Text(
                    '38.95',
                    style: TextStyle(color: Colors.orange),
                  )),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text('Thấp')),
                  Expanded(
                      child: Text(
                    '38.95',
                    style: TextStyle(color: Colors.blue),
                  )),
                  Expanded(child: Text('TB')),
                  Expanded(
                      child: Text(
                    '38.95',
                    style: TextStyle(color: Colors.red),
                  )),
                  Expanded(child: Text('Cao')),
                  Expanded(
                      child: Text(
                    '38.95',
                    style: TextStyle(color: Colors.orange),
                  )),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(8),
        ),
        Container(
          margin:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          width: SizeConfig.screenWidth,
          height: 0.5,
          color: Colors.grey,
        ),
        SizedBox(
          height: getProportionateScreenHeight(8),
        ),
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Dư mua '),
                  Text(
                    '9.6k',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Dư bán '),
                  Text(style: TextStyle(color: Colors.white), '14k'),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(8),
        ),
      ],
    );
  }
}
