import 'package:entrade_x/size_config.dart';
import 'package:entrade_x/strings.dart';
import 'package:entrade_x/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../blocs/money/money_bloc.dart';
import '../../../../../constrants.dart';

class MoneyWidget extends StatelessWidget {
  const MoneyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoneyBloc, MoneyState>(
      builder: (context, state) {
        if (state is ShowHideMoneyState) {
          return Container(
            width: SizeConfig.screenWidth,
            margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(8)),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kBgHomeContainer,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      state.isShow == true
                          ? const Text(
                              '0',
                              style: kTextWhite20Bold,
                            )
                          : const Text(
                              '*** *** ***',
                              style: kTextWhite20Bold,
                            ),
                      sbw(10),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                            padding: EdgeInsets.zero,
                            width: getProportionateScreenWidth(18),
                            height: getProportionateScreenHeight(18),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: kRedButtonBG,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            child: const Icon(
                              Icons.add,
                              size: 18,
                            )),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: getProportionateScreenHeight(30),
                              width: getProportionateScreenWidth(20),
                              child: GestureDetector(
                                onTap: () {
                                  BlocProvider.of<MoneyBloc>(context)
                                      .add(ShowHideMoneyEvent());
                                },
                                child: state.isShow
                                    ? buildIconShowHide(imgPath: sHide)
                                    : buildIconShowHide(imgPath: sShow),
                              ),
                            ),
                            sbw(10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      sInfoCheck,
                      style: kTextGrey15Normal,
                    ),
                    sbw(10),
                    InkWell(
                      onTap: () {
                        showToast('Hôm nay, khoản đầu tư của bạn tăng 0đ');
                      },
                      child: SizedBox(
                        width: getProportionateScreenWidth(18),
                        height: getProportionateScreenHeight(18),
                        child: const Icon(
                          Icons.info_outline,
                          size: 18,
                        ),
                      ),
                    )
                  ],
                ),
                sbh(4),
                const Text(
                  '0',
                  style: kTextGreen16Normal,
                )
              ],
            ),
          );
        } else {
          return Center(
            child: Text(state.toString()),
          );
        }
      },
    );
  }

  Image buildIconShowHide({required String imgPath}) {
    return Image.asset(
      imgPath,
      color: kWhite,
    );
  }
}
