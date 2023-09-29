import 'package:entrade_x/ui/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../api/local_auth_api.dart';
import '../../../../blocs/login/login_bloc.dart';
import '../../../components/button_default.dart';
import '../../../components/circle_k.dart';

class BodyLogin extends StatefulWidget {
  const BodyLogin({
    super.key,
  });

  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  String? email;
  String? pass;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;


    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrade X'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: const AssetImage('assets/images/ready_stock.png'),
                    height: 100.h,
                    width: 100.h,
                  ),
                  const Text(
                    'Entrade ',
                    style: TextStyle(fontSize: 44, color: Colors.white),
                  ),
                  const Text(
                    'X',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFormField(
                onChanged: (value) {
                  email = value;
                  print(email);
                },
                // onTap: onTap,
                decoration: const InputDecoration(
                  hintText: 'Email hoặc số điện thoại',
                ),
              ),
              TextFormField(
                obscureText: true,
                onChanged: (value) {
                  pass = value;
                  print(pass);
                },
                // onTap: onTap,
                decoration: const InputDecoration(
                  hintText: 'Mật khẩu',
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Quên mật khẩu?',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ButtonLoginWidget(
                      screenSize: screenSize,
                      onTap: () {
                        if (email == null || pass == null) {
                          Fluttertoast.showToast(
                            msg: "Trường email và mật khẩu không được để trống",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 26.sp,
                          );
                        } else {
                          context
                              .read<LoginBloc>()
                              .add(LoginAccountEvent(email!, pass!, context));
                        }
                      },
                      text: 'Đăng nhập',
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  buildCircleK(
                    onClicked: () async {
                      final isAuthenticated = await LocalAuthApi.authenticate();

                      if (isAuthenticated) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) =>  HomeScreen()),
                        );
                      }
                    },
                    demo: const Image(
                      image: AssetImage('assets/images/fingerprint_scan.png'),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.red,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: screenSize.width,
                child: const Text(
                  'Hoặc sử dụng',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildCircleK(
                        demo: SvgPicture.asset(
                          'assets/icons/facebook-2.svg',
                          alignment: Alignment.center,
                          // fit: BoxFit.cover,
                        ),
                        color: Colors.white,
                        onClicked: () {}),
                    SizedBox(
                      width: 20.w,
                    ),
                    buildCircleK(
                        onClicked: () {},
                        demo: SvgPicture.asset(
                          'assets/icons/google-icon.svg',
                          alignment: Alignment.center,
                          // fit: BoxFit.cover,
                        ),
                        color: Colors.white),
                  ],
                ),
              ),
              SizedBox(
                height: 70.h,
              ),
              SizedBox(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: screenSize.width,
                  child: const Text(
                    'Mở tài khoản',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  width: screenSize.width,
                  child: const Text(
                    'Điều khoản sử dụng',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
