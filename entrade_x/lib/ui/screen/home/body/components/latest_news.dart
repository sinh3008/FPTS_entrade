import 'package:flutter/material.dart';

import '../../../../../repo/i_data_info_fake.dart';

class LatestNews extends StatelessWidget {

  IDataInfoFake infoFake = IDataInfoFake();


  static const _biggerFont = TextStyle(fontSize: 18.0, color: Colors.white);

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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: width * 0.03),
            InkWell(
              onHover: (sss) {},
              child: const SizedBox(
                width: 28,
                height: 28,
                child: Icon(Icons.info_outline),
              ),
            ),
            const Expanded(
              child: Text(
                'Xem tất cả',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.end,
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
