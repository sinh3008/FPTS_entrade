import 'package:entrade_x/toast.dart';
import 'package:flutter/material.dart';

import '../../../../../../repo/informations.dart';
import 'last_new_all.dart';

// ignore: must_be_immutable
class LatestNewsWidget extends StatelessWidget {
  IDataInfoFake infoFake = IDataInfoFake();

  static const _biggerFont = TextStyle(fontSize: 14.0, color: Colors.white);

  LatestNewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: width * 0.03),
            const Text(
              'Tin vĩ mô',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(width: width * 0.03),
            InkWell(
              onTap: () {
                showToast('Tin tức được cập nhật mới nhất');
              },
              child: const SizedBox(
                width: 18,
                height: 18,
                child: Icon(
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
                child: const Text(
                  'Xem tất cả',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            SizedBox(
              width: width * 0.03,
            ),
          ],
        ),
        SizedBox(
          height: height * 0.01,
        ),
        SizedBox(
          width: width,
          height: 120,
          child: PageView.builder(
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              width: width,
              color: const Color(0xff202123),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * 0.6,
                            child: Text(
                              infoFake.list[index].title,
                              style: _biggerFont,
                              maxLines: 2,
                            ),
                          ),
                          Row(
                            children: [
                              Text(infoFake.list[index].time),
                              const SizedBox(
                                width: 30,
                              ),
                              Text(infoFake.list[index].author),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: width * 0.3,
                        child: Image(
                          image: AssetImage(infoFake.list[index].imagePath),
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
            scrollDirection: Axis.horizontal,
            itemCount: infoFake.list.length,
          ),
        ),
      ],
    );
  }
}
