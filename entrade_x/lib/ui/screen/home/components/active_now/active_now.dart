import 'package:entrade_x/theme/constrants.dart';
import 'package:entrade_x/other/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../blocs/bank/bankitem_bloc.dart';
import 'list_bank_page.dart';

// ignore: must_be_immutable
class ActiveNowPage extends StatelessWidget {
  ActiveNowPage({super.key, required this.id});

  String coppyCt = '';
  final int id;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Nộp tiền'),
      ),
      body: BlocBuilder<BankitemBloc, BankitemState>(
        builder: (context, state) {
          if (state is BankitemLoadingState) {
            return const CircularProgressIndicator();
          } else if (state is BankitemSuccessState) {
            return Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  TextFormField(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ListBankPage();
                        },
                      ));
                    },
                    autofocus: true,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: state.bank.name,
                      labelText: 'Chọn ngân hàng thụ hưởng',
                      labelStyle: const TextStyle(fontSize: 12),
                      suffixIcon: Icon(
                        Icons.navigate_next_sharp,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  const Text('Sở giao dịch hà nội'),
                  const Text('Tiền nộp được duyệt nhanh 24/7'),
                  const Text('Vui lòng chuyển vào tài khoản sau'),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  buildRow(
                      context: context,
                      width: width,
                      state: state,
                      text: state.bank.stk.toString(),
                      onTap: () {
                        coppyCt = state.bank.stk.toString();
                        showToast('Coppy Thành công');
                      }),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  buildRow(
                      context: context,
                      width: width,
                      state: state,
                      text: state.bank.dvThuHuong.toString(),
                      onTap: () {
                        coppyCt = state.bank.dvThuHuong.toString();
                        showToast('Coppy Thành công');
                      }),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  buildRow(
                    context: context,
                    onTap: () {
                      coppyCt = state.bank.nd.toString();
                      showToast('Coppy Thành công');
                    },
                    width: width,
                    state: state,
                    text: state.bank.nd.toString(),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text(state.toString()),
            );
          }
        },
      ),
    );
  }

  Row buildRow(
      {required double width,
      required BankitemSuccessState state,
      required String text,
      void Function()? onTap,
      required BuildContext context}) {
    return Row(
      children: [
        buildContainer(
          demo: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: width * 0.06),
            child: Text(text),
          ),
          color: Theme.of(context).appBarTheme.foregroundColor ?? kGrey,
          width: width * 0.7,
          height: width * 0.13,
        ),
        SizedBox(
          width: width * 0.02,
        ),
        GestureDetector(
          onTap: onTap,
          child: buildContainer(
            demo: const Icon(Icons.copy, size: 20),
            color: Theme.of(context).appBarTheme.foregroundColor ?? kGrey,
            width: width * 0.2,
            height: width * 0.13,
          ),
        ),
      ],
    );
  }

  Container buildContainer(
      {required double width,
      required double height,
      required Color color,
      required Widget demo}) {
    return Container(
      width: width,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      height: height,
      child: demo,
    );
  }
}
