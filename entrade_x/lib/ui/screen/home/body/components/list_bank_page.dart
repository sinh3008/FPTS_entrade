import 'package:entrade_x/blocs/bank/bankitem_bloc.dart';
import 'package:entrade_x/repo/banks.dart';
import 'package:entrade_x/ui/screen/home/body/components/active_now.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListBankPage extends StatelessWidget {
  ListBankPage({super.key});

  Banks banks = Banks();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: banks.list.length,
        itemBuilder: (context, index) {
          return TextButton(
            onPressed: () {
              context.read<BankitemBloc>().add(BankClickedItemEvent(index));
              Navigator.pop(context);
            },
            child: Text(banks.list[index].name),
          );
        },
      ),
    );
  }
}
