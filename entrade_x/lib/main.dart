import 'package:entrade_x/blocs/bank/bankitem_bloc.dart';
import 'package:entrade_x/blocs/banks/bank_bloc.dart';
import 'package:entrade_x/blocs/chart/chart_bloc.dart';
import 'package:entrade_x/blocs/conditional/conditional_bloc.dart';
import 'package:entrade_x/blocs/home/home_bloc.dart';
import 'package:entrade_x/blocs/ideas/ideas_bloc.dart';
import 'package:entrade_x/blocs/login/login_bloc.dart';
import 'package:entrade_x/blocs/money/money_bloc.dart';
import 'package:entrade_x/routes.dart';
import 'package:entrade_x/theme.dart';
import 'package:entrade_x/ui/screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
        BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
        BlocProvider<ChartBloc>(create: (context) => ChartBloc()),
        BlocProvider<MoneyBloc>(create: (context) => MoneyBloc()),
        BlocProvider<IdeasBloc>(create: (context) => IdeasBloc()),
        BlocProvider<BankBloc>(create: (context) => BankBloc()),
        BlocProvider<BankitemBloc>(create: (context) => BankitemBloc()),
        BlocProvider<ConditionalBloc>(create: (context) => ConditionalBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: darkTheme,
        routes: routes,
        initialRoute: LoginScreen.routeName,
      ),
    );
  }
}
