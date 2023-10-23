import 'package:entrade_x/blocs/conditional/conditional_bloc.dart';
import 'package:entrade_x/constrants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../models/dataka.dart';
import '../../../../size_config.dart';

class BuocGiaContainer extends StatelessWidget {
  const BuocGiaContainer({
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
          alignment: Alignment.center,
          child: DataTable(
            horizontalMargin: 0,
            headingRowHeight: 0,
            dataRowMinHeight: getProportionateScreenHeight(30),
            dataRowMaxHeight: getProportionateScreenHeight(30),
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
                      height: getProportionateScreenHeight(26),
                      width: SizeConfig.screenWidth * 0.46,
                      decoration: BoxDecoration(
                        color: kGrey,
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.transparent,
                            // Màu bên trái
                            kGreen.withOpacity(0.2),
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
                            style: kTextWhite16Normal,
                          ),
                          GestureDetector(
                            onTap: () => context.read<ConditionalBloc>().add(
                                ClickFitPriceEvent(dataList1[index].number)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: getProportionateScreenWidth(16)),
                              child: Text(
                                dataList1[index].number.toString(),
                                style: kTextGreen16Normal,
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
                      height: getProportionateScreenHeight(26),
                      width: SizeConfig.screenWidth * 0.46,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Colors.transparent,
                            // Màu bên trái
                            kRedButtonBG.withOpacity(0.2),
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
                      child: SizedBox(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => context.read<ConditionalBloc>().add(
                                  ClickFitPriceEvent(dataList2[index].number)),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: getProportionateScreenWidth(16)),
                                child: Text(
                                  dataList2[index].number.toString(),
                                  style: kTextGreen16Normal,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              // padding: const EdgeInsets.only(left: 16.0),
                              child: Text(dataList2[index].price.toString(),
                                  style: kTextWhite16Normal),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
          child: Column(
            children: [
              Container(
                width: SizeConfig.screenWidth * 1,
                height: 0.5,
                color: kGrey.withOpacity(0.3),
              ),
              SizedBox(
                height: getProportionateScreenHeight(2),
              ),
              SizedBox(
                width: SizeConfig.screenWidth * 1,
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          height: 6,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(30)),
                            color: kGreen.withOpacity(0.4),
                          ),
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                            color: kRedButtonBG.withOpacity(0.4),
                          ),
                          height: getProportionateScreenHeight(6),
                        )),
                  ],
                ),
              ),
              sbh(8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('Dư mua '),
                      Text(
                        '9.6k',
                        style: kTextWhite15Normal,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Dư bán '),
                      Text(style: kTextWhite15Normal, '14k'),
                    ],
                  )
                ],
              ),
              sbh(8),
              Container(
                width: SizeConfig.screenWidth,
                height: 0.5,
                color: kGrey,
              ),
              sbh(8),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildRowSan(
                          text1: 'Sàn',
                          text2: '79.30',
                          color: const Color(0xff44caf3)),
                      sbw(30),
                      buildRowSan(
                          text1: 'TC',
                          text2: '85.20',
                          color: const Color(0xffe8a722)),
                      sbw(30),
                      buildRowSan(
                          text1: 'Trần',
                          text2: '91.10',
                          color: const Color(0xfff068fb)),
                    ],
                  ),
                  sbh(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildRowSan(
                          text1: 'Thấp', text2: '84.30', color: kRedButtonBG),
                      SizedBox(
                        width: getProportionateScreenWidth(30),
                      ),
                      buildRowSan(
                          text1: 'TB', text2: '84.54', color: kRedButtonBG),
                      SizedBox(
                        width: getProportionateScreenWidth(30),
                      ),
                      buildRowSan(
                          text1: 'Cao', text2: '85.10', color: kRedButtonBG),
                    ],
                  )
                ],
              ),
              sbh(8),
              Container(
                width: SizeConfig.screenWidth,
                height: 0.5,
                color: kGrey,
              ),
              sbh(8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('NN Mua '),
                      Text(
                        '55k',
                        style: kTextWhite15Normal,
                      ),
                      Text('  |  '),
                      Text('NN Bán '),
                      Text(
                        '219k',
                        style: kTextWhite15Normal,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Dư bán '),
                      Text(style: kTextWhite15Normal, '14k'),
                    ],
                  )
                ],
              ),
              sbh(8),
            ],
          ),
        )
      ],
    );
  }

  Expanded buildRowSan(
      {required String text1, required String text2, required Color color}) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
          ),
          Text(
            text2,
            style: TextStyle(color: color),
          )
        ],
      ),
    );
  }
}
