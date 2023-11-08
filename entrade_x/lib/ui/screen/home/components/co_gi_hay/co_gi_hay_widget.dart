
import 'package:entrade_x/theme/constrants.dart';
import 'package:entrade_x/theme/size_config.dart';
import 'package:entrade_x/other/strings.dart';
import 'package:flutter/material.dart';

class CoGiHayContainer extends StatelessWidget {
  const CoGiHayContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizeBoxHeight(4),
          Padding(
            padding: EdgeInsets.only(
                left: getProportionateScreenWidth(10),
                bottom: getProportionateScreenHeight(10),
                top: getProportionateScreenHeight(10)),
            child: Text(
              sCoGiHay,
              style: kTextGrey14Normal.copyWith(fontWeight: w500),
            ),
          ),
          sizeBoxHeight(4),
          Item2(context: context,  bgImg: const Color(0xfff3d5f7),),
          sizeBoxHeight(1),
          Item2(
            context: context,
            bgImg: const Color(0xffd4eaf5),
            // bgImg: const Color(0xfff3d5f7),
            imgPath: 'assets/images/cyber-security.png',
            title: 'Smart OTP',
            content1_1: '21,922 ',
            content1_2: 'KH sử dụng an toàn và bảo mật',
            content2_1: 'Miễn phí',
            content2_2: ' đăng ký',
          ),
          sizeBoxHeight(1),
          Item2(
            context: context,
            bgImg: const Color(0xff403521),
            imgPath: 'assets/images/mobile.png',
            title: 'Hướng dẫn giao dịch',
            content1_1: '80 ',
            content1_2: 'Hướng dẫn chi tiết',
            content2_1: '401',
            content2_2: ' người tìm được thông tin',
          ),
          sizeBoxHeight(10),
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Container Item2(
    {Color bgImg = Colors.red,
    String imgPath = 'assets/images/gift-box.png',
    String title = 'Quà tặng - Gift X',
    IconData iconData1 = Icons.person,
    IconData iconData2 = Icons.person,
    String content1_1 = '2,504 ',
    String content1_2 = 'món quà đã tạo',
    String content2_1 = '21,992 ',
    String content2_2 = 'KH đã sử dụng an toàn và bảo mật',
    required BuildContext context}) {
  double width = SizeConfig.screenWidth;
  double height = SizeConfig.screenHeight;
  return Container(
    decoration:
        BoxDecoration(color: Theme.of(context).appBarTheme.foregroundColor),
    width: SizeConfig.screenWidth,
    height: SizeConfig.screenHeight * 0.13,
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            width: width,
            height: height,
            margin: const EdgeInsets.all(14),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: bgImg, borderRadius: BorderRadius.circular(8)),
            child: Image(
              image: AssetImage(imgPath),
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Container(
            width: width,
            height: height,
            margin: const EdgeInsets.only(top: 14, right: 14, bottom: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      iconData1,
                      size: kSizeIconsHost,
                    ),
                    Text(
                      content1_1,
                      style: const TextStyle(fontSize: 14),
                    ),
                    Text(
                      content1_2,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Icon(
                      iconData2,
                      size: kSizeIconsHost,
                    ),
                    Text(
                      content2_1,
                      style: const TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                        child: Text(
                      content2_2,
                      style: const TextStyle(fontSize: 12),
                      maxLines: 2,
                    )),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            width: width,
            alignment: Alignment.bottomRight,
            height: height,
            margin: const EdgeInsets.only(top: 14, right: 14, bottom: 14),
            child: const Icon(Icons.navigate_next),
          ),
        ),
      ],
    ),
  );
}
