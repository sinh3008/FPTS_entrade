import 'package:entrade_x/theme/constrants.dart';
import 'package:entrade_x/other/toast.dart';
import 'package:flutter/material.dart';

import '../../../../../../repo/informations.dart';
import '../../../../../theme/size_config.dart';
import 'last_new_all.dart';

// ignore: must_be_immutable
class LatestNewsWidget extends StatelessWidget {
  IDataInfoFake infoFake = IDataInfoFake();

  LatestNewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        sizeBoxHeight(10),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tin vĩ mô',
                style:
                    kTextGrey16Normal.copyWith(fontWeight: w500),
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
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.backgroundColor,
          ),
          width: SizeConfig.screenWidth,
          height: 120,
          child: PageView.builder(
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(10),
                  horizontal: getProportionateScreenWidth(8)),
              width: SizeConfig.screenWidth,
              // color: kBgHomeContainer,
              child: SizedBox(
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
                                style: kTextGrey16Normal.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
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
