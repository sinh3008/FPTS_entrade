import 'package:entrade_x/size_config.dart';
import 'package:entrade_x/ui/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        title:  Text('Entrade X', style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),),
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
              const SizedBox(
                height: 20,
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/ready_stock.png'),
                    height: 60,
                    width: 60,
                  ),
                  Text(
                    'Entrade ',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Text(
                    'X',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                onChanged: (value) {
                  email = value;
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
                },
                // onTap: onTap,
                decoration: const InputDecoration(
                  hintText: 'Mật khẩu',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Quên mật khẩu?',
                  style: TextStyle(color: Colors.red, fontSize: 14),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ButtonLoginWidget(
                      width: SizeConfig.screenWidth * 0.4,
                      height: getProportionateScreenHeight(50),
                      onTap: () {
                        if (email == null || pass == null) {
                          Fluttertoast.showToast(
                            msg: "Trường email và mật khẩu không được để trống",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            fontSize: 14,
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
                  const SizedBox(
                    width: 20,
                  ),
                  buildCircleK(
                    onClicked: () async {
                      final isAuthenticated = await LocalAuthApi.authenticate();

                      if (isAuthenticated) {
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
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
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: screenSize.width,
                child: const Text(
                  'Hoặc sử dụng',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
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
                    const SizedBox(
                      width: 20,
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
              const SizedBox(
                height: 70,
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
                      fontWeight: FontWeight.normal,
                    ),
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
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  width: screenSize.width,
                  child: const Text(
                    'Hỗ trợ trực tuyến',
                    style: TextStyle(
                      color: Colors.red,
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
