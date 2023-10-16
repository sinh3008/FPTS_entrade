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
        theme: theme(),
        routes: routes,
        initialRoute: LoginScreen.routeName,
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//   bool _isAnimating = false;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 1),
//     );

//     _animation = Tween<double>(begin: 50, end: 100).animate(_controller);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _startAnimation() {
//     if (!_isAnimating) {
//       _controller.forward();
//     } else {
//       _controller.reverse();
//     }
//     setState(() {
//       _isAnimating = !_isAnimating;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Animated Container Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             AnimatedBuilder(
//               animation: _animation,
//               builder: (context, child) {
//                 return Container(
//                   width: _animation.value,
//                   height: _animation.value,
//                   color: Colors.blue,
//                   child: _isAnimating
//                       ? Center(
//                           child: Text(
//                             'Hello, Animation!',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         )
//                       : null,
//                 );
//               },
//             ),
//             ElevatedButton(
//               onPressed: _startAnimation,
//               child: Text(
//                   _isAnimating ? 'Reverse animation' : 'Forward animation'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
