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
                const EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xff262626),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: state.isShow == true
                            ? const Text(
                                '0',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : const Text(
                                '*** *** ***',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 6.0, top: width * 0.03),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                              width: 20,
                              height: 20,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
                              child: const Icon(
                                Icons.add,
                                size: 20,
                              )),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 30,
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
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    InkWell(
                      onHover: (sss) {},
                      child: const SizedBox(
                        width: 28,
                        height: 28,
                        child: Icon(Icons.info_outline),
                      ),
                    )
                  ],
                ),
                const Text(
                  '0',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
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
