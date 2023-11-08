import 'package:auto_size_text/auto_size_text.dart';
import 'package:entrade_x/other/strings.dart';
import 'package:flutter/material.dart';

import '../../../../repo/news_follows_list.dart';
import '../../../../theme/constrants.dart';
import '../../../../theme/size_config.dart';
import '../../home/components/lastnew/last_new_all.dart';

class SensesContainer extends StatefulWidget {
  const SensesContainer({super.key});

  @override
  State<SensesContainer> createState() => _SensesContainerState();
}

class _SensesContainerState extends State<SensesContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8)),
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.foregroundColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Senses',
                style: kText15Normal.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: w700),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Xem thêm',
                  style: kTextRed15Normal.copyWith(fontWeight: w700),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '5 ngày',
                    style: kTextWhite15Normal,
                  ),
                  sizeBoxHeight(6),
                  Text(
                    '-3,39%',
                    style: kTextWhite15Normal.copyWith(
                        color: kRedButtonBG, fontWeight: w500),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '1 năm',
                    style: kTextWhite15Normal,
                  ),
                  sizeBoxHeight(6),
                  Text(
                    '24.35%',
                    style: kTextWhite15Normal.copyWith(
                        color: Colors.green, fontWeight: w500),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Vốn hoá',
                    style: kTextWhite15Normal,
                  ),
                  sizeBoxHeight(6),
                  Text(
                    '137,204,89 tỷ',
                    style: kTextWhite15Normal.copyWith(fontWeight: w500),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'P/E',
                    style: kTextWhite15Normal,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    '7.8x',
                    style: kTextWhite15Normal.copyWith(fontWeight: w500),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'P/S',
                    style: kTextWhite15Normal,
                  ),
                  sizeBoxHeight(6),
                  Text(
                    '2.9x',
                    style: kTextWhite15Normal.copyWith(fontWeight: w500),
                  )
                ],
              ),
            ],
          ),
          sizeBoxHeight(10),
          lineBreak(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tin liên quan',
                  style: kText15Normal.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: w700)),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return LastNewAll();
                    },
                  ));
                },
                child: Text(
                  'Xem thêm',
                  style: kTextRed15Normal.copyWith(fontWeight: w700),
                ),
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(360),
            width: SizeConfig.screenWidth,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listNewsFl.length,
              itemBuilder: (context, index) {
                if (listNewsFl[index].imgPath.isEmpty) {
                  return Column(
                    children: [
                      sizeBoxHeight(10),
                      AutoSizeText(
                        listNewsFl[index].title,
                        style: kTextWhite15Normal.copyWith(fontWeight: w400),
                        minFontSize: 12,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      sizeBoxHeight(10),
                      Container(
                        width: SizeConfig.screenWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            container(
                                text: listNewsFl[index].content,
                                color: Colors.green),
                            sizeBoxWidth(10),
                            container(
                                text: listNewsFl[index].content,
                                color: Colors.redAccent),
                            sizeBoxWidth(10),
                            container(
                                text: listNewsFl[index].content,
                                color: Colors.redAccent),
                            sizeBoxWidth(10),
                          ],
                        ),
                      ),
                      sizeBoxHeight(10),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time_sharp,
                            color: kGrey,
                          ),
                          sizeBoxWidth(10),
                          Text(listNewsFl[index].time)
                        ],
                      ),
                      sizeBoxHeight(10),
                      lineBreak(),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  listNewsFl[index].title,
                                  style: kTextWhite15Normal,
                                  minFontSize: 12,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                sizeBoxHeight(10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    container(
                                        text: listNewsFl[index].content,
                                        color: Colors.green),
                                    sizeBoxWidth(10),
                                    container(
                                        text: listNewsFl[index].content,
                                        color: Colors.redAccent),
                                    sizeBoxWidth(10),
                                    container(
                                        text: '+1', color: Colors.redAccent),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: getProportionateScreenHeight(6)),
                              width: getProportionateScreenWidth(80),
                              height: getProportionateScreenHeight(80),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(sTrade),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time_sharp,
                            color: kGrey,
                          ),
                          sizeBoxWidth(10),
                          Text(listNewsFl[index].time)
                        ],
                      ),
                      sizeBoxHeight(10),
                      lineBreak(),
                    ],
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

Container container(
    {required Color color,
    required String text,
    EdgeInsetsGeometry? padding =
        const EdgeInsets.symmetric(horizontal: 6, vertical: 3)}) {
  return Container(
    padding: padding,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: color.withOpacity(0.2),
    ),
    child: Text(
      text,
      style: kTextWhite15Normal.copyWith(color: color),
      textAlign: TextAlign.center,
    ),
  );
}
