import 'package:entrade_x/blocs/chart/chart_bloc.dart';
import 'package:entrade_x/blocs/home/home_bloc.dart';
import 'package:entrade_x/blocs/login/login_bloc.dart';
import 'package:entrade_x/blocs/money/money_bloc.dart';
import 'package:entrade_x/routes.dart';
import 'package:entrade_x/theme.dart';
import 'package:entrade_x/ui/screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
          BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
          BlocProvider<ChartBloc>(create: (context) => ChartBloc()),
          BlocProvider<MoneyBloc>(create: (context) => MoneyBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          routes: routes,
          initialRoute: LoginScreen.routeName,
        ),
      ),
    );
  }
}
