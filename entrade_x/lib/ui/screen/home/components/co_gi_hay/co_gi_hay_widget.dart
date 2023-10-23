import 'package:auto_size_text/auto_size_text.dart';
import 'package:entrade_x/constrants.dart';
import 'package:entrade_x/size_config.dart';
import 'package:entrade_x/strings.dart';
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
          sbh(4),
          Padding(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
            child: Text(
              sCoGiHay,
              style: kTextGrey14Normal.copyWith(fontWeight: w500),
            ),
          ),
          sbh(4),
          ItemCoGiHay(
              backIconColor: const Color(0xff3c2140),
              imgPath: sGiftBox,
              imgPath2: sGiftBox,
              imgPath3: sDola,
              title: 'Quà tặng - Gift X',
              content1_1: '23,62 ',
              content1_2: 'Món quà đã được trao',
              content2_1: '9,452,415,766',
              content2_2: ' đã được gửi tặng',
              onTap: () {}),
          SizedBox(
            height: SizeConfig.screenHeight * 0.01,
          ),
          ItemCoGiHay(
              backIconColor: const Color(0xff1e373e),
              imgPath: 'assets/images/cyber-security.png',
              imgPath2: 'assets/images/cyber-security.png',
              imgPath3: 'assets/images/dollar.png',
              title: 'Smart OTP',
              content1_1: '',
              content1_2: '21,922 KH đã sử dụng an toàn\n và bảo mật',
              content2_1: 'Miễn phí',
              content2_2: ' đăng ký',
              onTap: () {}),
          SizedBox(
            height: SizeConfig.screenHeight * 0.01,
          ),
          ItemCoGiHay(
              backIconColor: const Color(0xff403521),
              imgPath: 'assets/images/mobile.png',
              imgPath2: 'assets/images/mobile.png',
              imgPath3: 'assets/images/dollar.png',
              title: 'Hướng dẫn giao dịch',
              content1_1: '80 ',
              content1_2: 'Hướng dẫn chi tiết',
              content2_1: '401',
              content2_2: ' người tìm được thông tin',
              onTap: () {}),
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Container ItemCoGiHay({
  required String imgPath,
  required String imgPath2,
  required String imgPath3,
  required String title,
  required String content1_1,
  required String content1_2,
  required String content2_1,
  required String content2_2,
  required Color backIconColor,
  void Function()? onTap,
}) {
  return Container(
    height: SizeConfig.screenHeight * 0.14,
    width: SizeConfig.screenWidth,
    padding: const EdgeInsets.all(12),
    color: kBgHomeContainer,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(8)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: backIconColor,
            ),
            child: Image(
              image: AssetImage(imgPath),
              width: getProportionateScreenWidth(40),
              height: SizeConfig.screenHeight * 0.12,
            ),
          ),
        ),
        sbw(10),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white),
              ),
              sbh(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage(imgPath2),
                    width: getProportionateScreenWidth(16),
                  ),
                  sbw(6),
                  // Text(content1_1),
                  AutoSizeText(
                    content1_1,
                    style: kTextGrey14Normal,
                    maxLines: 2,
                  ),
                  // Text(content1_2),
                  AutoSizeText(
                    content1_2,
                    style: kTextGrey14Normal,
                    maxLines: 2,
                  )
                ],
              ),
              sbh(6),
              Row(
                children: [
                  Image(
                    image: AssetImage(imgPath3),
                    width: 16,
                  ),
                  sbw(6),
                  Text(content2_1),
                  Text(content2_2),
                ],
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              alignment: Alignment.bottomRight,
              child: const Icon(
                Icons.navigate_next,
                color: Colors.green,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
