import 'package:entrade_x/strings.dart';

class NewsFollow {
  String title;
  String imgPath;
  String content;
  String time;

  NewsFollow(this.title, this.imgPath, this.content, this.time);
}

List<NewsFollow> listNewsFl = [
  NewsFollow(
      'Sacombank, Vietinbank, Vietcombank được dự báo dẫn đầu về tăng trưởng',
      '',
      'CTG + 0.17%',
      '2 giờ trước'),
  NewsFollow(
      'Các quỹ đầu tư lạc quan về thị trường. Các quỹ đầu tư lạc quan về thị trường',
      sTrade,
      'CTG + 0.17%',
      '2 giờ trước'),
  NewsFollow(
      'Cổ phiếu ngân hàng đang được định giá thấp kỷ lục, một mã có tiềm năng tới 47%',
      '',
      'CTG + 0.17%',
      '2 giờ trước'),
];
