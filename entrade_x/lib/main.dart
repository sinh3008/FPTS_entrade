import 'package:entrade_x/blocs/theme/theme_bloc.dart';
import 'package:entrade_x/other/routes.dart';
import 'package:entrade_x/theme/theme.dart';
import 'package:entrade_x/ui/screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/bank/bankitem_bloc.dart';
import '../../../blocs/banks/bank_bloc.dart';
import '../../../blocs/chart/chart_bloc.dart';
import '../../../blocs/conditional/conditional_bloc.dart';
import '../../../blocs/home/home_bloc.dart';
import '../../../blocs/ideas/ideas_bloc.dart';
import '../../../blocs/login/login_bloc.dart';
import '../../../blocs/money/money_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc()..add(InitThemeEvent()),
        ),
        BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
        BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
        BlocProvider<ChartBloc>(create: (context) => ChartBloc()),
        BlocProvider<MoneyBloc>(create: (context) => MoneyBloc()),
        BlocProvider<IdeasBloc>(create: (context) => IdeasBloc()),
        BlocProvider<BankBloc>(create: (context) => BankBloc()),
        BlocProvider<BankitemBloc>(create: (context) => BankitemBloc()),
        BlocProvider<ConditionalBloc>(create: (context) => ConditionalBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.isDark ? darkThemeData : lightThemeData,
            routes: routes,
            initialRoute: LoginScreen.routeName,
          );
        },
      ),
    );
  }
}
