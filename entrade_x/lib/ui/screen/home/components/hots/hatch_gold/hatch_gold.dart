// ignore_for_file: non_constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:entrade_x/models/egg.dart';
import 'package:entrade_x/repo/eggs.dart';
import 'package:entrade_x/ui/components/circle_k.dart';
import 'package:flutter/material.dart';

class HatchGoldPage extends StatefulWidget {
  const HatchGoldPage({super.key});

  @override
  State<HatchGoldPage> createState() => _HatchGoldPageState();
}

class _HatchGoldPageState extends State<HatchGoldPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    Eggs eggss = Eggs();
    // ignore: no_leading_underscores_for_local_identifiers
    List<Egg> _lists = eggss.list;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Trứng vàng Entrade X'),
        actions: [
          buildCircleK(
            width: 30,
            padding: const EdgeInsets.all(0),
            height: 30,
            border: Border.all(color: Colors.red, strokeAlign: 1, width: 2),
            demo: const Center(
                child: Icon(
              Icons.question_mark_sharp,
              size: 16,
              color: Colors.red,
            )),
            color: Theme.of(context).appBarTheme.foregroundColor,
            onClicked: () {},
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color:Theme.of(context).appBarTheme.foregroundColor,
            padding: const EdgeInsets.all(12),
            width: width,
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Tổng tiền khả dụng'),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '0',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 18,
                        height: 18,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        child: const Icon(
                          Icons.add,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.02),
            child: const Text(
              'Danh sách trứng',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _lists.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // ignore: avoid_print
                    print('object $index');
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: height * 0.01),
                    width: width,
                    height: height * 0.14,
                    padding: const EdgeInsets.all(12),
                    color:Theme.of(context).appBarTheme.foregroundColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image(
                            image: AssetImage(_lists[index].imgPath),
                            width: 40,
                            height: height * 0.12,
                          ),
                        ),
                        SizedBox(
                          width: width * 0.04,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _lists[index].name,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              children: [
                                const AutoSizeText(
                                  'Thời gian ấp',
                                  style: TextStyle(fontSize: 14),
                                  maxLines: 2,
                                ),
                                SizedBox(
                                  width: width * 0.04,
                                ),
                                AutoSizeText(
                                  _lists[index].time,
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.white),
                                  maxLines: 2,
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              children: [
                                const Text('Lợi xuất cơ bản'),
                                SizedBox(
                                  width: width * 0.04,
                                ),
                                Text(
                                  '${_lists[index].loi_xuat}%/ năm',
                                  style: const TextStyle(color: Colors.green),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class ItemEggWidget extends StatelessWidget {
  const ItemEggWidget({
    super.key,
    required this.width,
    required this.height,
    required this.imgPath,
    required this.name,
    required this.time,
    required this.loi_xuat,
  });

  final double width;
  final double height;
  final String imgPath;
  final String name;
  final String time;
  final double loi_xuat;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: height * 0.01),
      width: width,
      height: height * 0.14,
      padding: const EdgeInsets.all(12),
      color: const Color(0xff222222),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image(
              image: AssetImage(imgPath),
              width: 40,
              height: height * 0.12,
            ),
          ),
          SizedBox(
            width: width * 0.04,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  const AutoSizeText(
                    'Thời gian ấp',
                    style: TextStyle(fontSize: 14),
                    maxLines: 2,
                  ),
                  SizedBox(
                    width: width * 0.04,
                  ),
                  AutoSizeText(
                    time,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                    maxLines: 2,
                  )
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  const Text('Lợi xuất cơ bản'),
                  SizedBox(
                    width: width * 0.04,
                  ),
                  Text(
                    '$loi_xuat%/ năm',
                    style: const TextStyle(color: Colors.green),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: height * 0.01,
          ),
        ],
      ),
    );
  }
}
