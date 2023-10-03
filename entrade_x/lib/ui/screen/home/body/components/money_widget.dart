import 'package:entrade_x/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../blocs/money/money_bloc.dart';

class MoneyWidget extends StatelessWidget {
  const MoneyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    // double height = screenSize.height;
    return BlocBuilder<MoneyBloc, MoneyState>(
      builder: (context, state) {
        if (state is ShowHideMoneyState) {
          return Container(
            width: width,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding:
                const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xff262626),
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
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : const Text(
                              '*** *** ***',
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
                              height: 30,
                              width: 20,
                              child: GestureDetector(
                                onTap: () {
                                  BlocProvider.of<MoneyBloc>(context)
                                      .add(ShowHideMoneyEvent());
                                },
                                child: state.isShow
                                    ? buildIconShowHide(
                                        imgPath: 'assets/images/hide.png')
                                    : buildIconShowHide(
                                        imgPath: 'assets/images/show.png'),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.01,
                            ),
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
                      'Hôm nay, khoản đầu tư tăng',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    InkWell(
                      onTap: () {
                        showToast('Hôm nay, khoản đầu tư của bạn tăng 0đ');
                      },
                      child: const SizedBox(
                        width: 18,
                        height: 18,
                        child: Icon(
                          Icons.info_outline,
                          size: 18,
                        ),
                      ),
                    )
                  ],
                ),
                const Text(
                  '0',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                  ),
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
      color: Colors.white,
    );
  }
}
