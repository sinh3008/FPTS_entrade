import 'package:entrade_x/constrants.dart';
import 'package:entrade_x/size_config.dart';
import 'package:entrade_x/toast.dart';
import 'package:flutter/material.dart';

import '../../../../../../repo/informations.dart';
import 'last_new_all.dart';

class LatestNewsWidget extends StatelessWidget {
  IDataInfoFake infoFake = IDataInfoFake();

  LatestNewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tin vĩ mô',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              sizeBoxWidth(30),
              InkWell(
                onTap: () {
                  showToast('Tin tức được cập nhật mới nhất');
                },
                child: SizedBox(
                  width: getProportionateScreenWidth(18),
                  height: getProportionateScreenHeight(18),
                  child: const Icon(
                    Icons.info_outline,
                    size: 18,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return LastNewAll();
                      },
                    ));
                  },
                  child: Text(
                    'Xem tất cả',
                    style: kTextWhite14Bold.copyWith(
                        color: kRedButtonBG,
                        decoration: TextDecoration.underline),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
        ),
        sizeBoxHeight(10),
        SizedBox(
          width: SizeConfig.screenWidth,
          height: 120,
          child: PageView.builder(
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(10),
                  horizontal: getProportionateScreenWidth(8)),
              width: SizeConfig.screenWidth,
              color: kBgHomeContainer,
              child: Container(
                height: 120,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: SizeConfig.screenWidth * 0.6,
                              child: Text(
                                infoFake.list[index].title,
                                style:
                                    kTextWhite14Bold.copyWith(fontWeight: w500),
                                maxLines: 2,
                              ),
                            ),
                            sizeBoxHeight(6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(infoFake.list[index].time),
                                sizeBoxWidth(30),
                                Text(infoFake.list[index].author),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.3,
                          child: Image(
                            image: AssetImage(infoFake.list[index].imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),

                    Expanded(
                      child: Text(
                        '${index + 1}/${infoFake.list.length}',
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            scrollDirection: Axis.horizontal,
            itemCount: infoFake.list.length,
          ),
        ),
      ],
    );
  }
}
