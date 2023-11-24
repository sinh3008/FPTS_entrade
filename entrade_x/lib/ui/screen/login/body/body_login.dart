import 'package:entrade_x/ui/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../api/local_auth_api.dart';
import '../../../../blocs/login/login_bloc.dart';
import '../../../../theme/constrants.dart';
import '../../../../other/strings.dart';
import '../../../../theme/size_config.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          sVersionApp,
          style: kTextGrey11Normal,
        ),
        centerTitle: true,
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
              sizeBoxHeight(20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: const AssetImage(sReadyStock),
                    height: getProportionateScreenHeight(60),
                    width: getProportionateScreenWidth(60),
                  ),
                  const Text(
                    sAppTitle,
                    style: kText30Bold,
                  ),
                  const Text(
                    'X',
                    style: kTextWhite15Bold,
                  ),
                ],
              ),
              sizeBoxHeight(30),
              TextFormField(
                onChanged: (value) {
                  email = value;
                },
                style: kText15Normal.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
                decoration: const InputDecoration(
                  hintText: sHintEmailLogin,
                  hoverColor: Colors.transparent,
                ),
              ),
              TextFormField(
                obscureText: true,
                style: kText15Normal.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
                onChanged: (value) {
                  pass = value;
                },
                // onTap: onTap,
                decoration: const InputDecoration(
                  hintText: sHintPassLogin,
                ),
              ),
              sizeBoxHeight(10),
              TextButton(
                onPressed: () {},
                child: const Text(
                  sForgotPassLogin,
                  style: kTextRed15Normal,
                  textAlign: TextAlign.start,
                ),
              ),
              sizeBoxHeight(10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ButtonLoginWidget(
                      radius: 30,
                      width: SizeConfig.screenWidth * 0.4,
                      height: getProportionateScreenHeight(50),
                      onTap: () {
                        if (email == null || pass == null) {
                          Fluttertoast.showToast(
                            msg: sEmailAndPassIsEmpty,
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
                      text: sLogin,
                    ),
                  ),
                  sizeBoxWidth(10),
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
                      image: AssetImage(sFingerprintScan),
                      fit: BoxFit.cover,
                    ),
                    color: kRedButtonBG,
                  ),
                ],
              ),
              sizeBoxHeight(25),
              SizedBox(
                width: SizeConfig.screenWidth,
                child: const Text(
                  sOrUse,
                  textAlign: TextAlign.center,
                  style: kTextGrey15Normal,
                ),
              ),
              sizeBoxHeight(25),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildCircleK(
                        demo: SvgPicture.asset(
                          sFb,
                          alignment: Alignment.center,
                          // fit: BoxFit.cover,
                        ),
                        color: Colors.white,
                        onClicked: () {}),
                    sizeBoxWidth(20),
                    buildCircleK(
                      onClicked: () {},
                      demo: SvgPicture.asset(sGg, alignment: Alignment.center),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              sizeBoxHeight(120),
              buttonBottomLogin(
                  text: sCreateAccount,
                  color: Colors.transparent.withOpacity(0.2),
                  margin: 40,
                  style: kTextRed15Normal.copyWith(fontWeight: w500)),
              buttonBottomLogin(text: sTermOfUse, margin: 40),
              buttonBottomLogin(text: sSupOnline, margin: 40),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buttonBottomLogin({
    double margin = 0,
    double padding = 12,
    double radius = 30,
    TextStyle style = kTextRed15Normal,
    required String text,
    Color color = Colors.transparent,
  }) {
    return SizedBox(
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(margin)),
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
        width: SizeConfig.screenWidth,
        child: Text(
          text,
          style: style,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
