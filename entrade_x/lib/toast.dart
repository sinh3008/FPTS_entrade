import 'package:fluttertoast/fluttertoast.dart';

void showToast(String toast) => Fluttertoast.showToast(
      msg: toast,
      toastLength: Toast.LENGTH_SHORT,
);
