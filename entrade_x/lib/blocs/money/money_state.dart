part of 'money_bloc.dart';

abstract class MoneyState {}

class MoneyInitial extends MoneyState {}

class LoadingMoneyState extends MoneyState {}

class ShowHideMoneyState extends MoneyState {
  final bool isShow;

  ShowHideMoneyState(this.isShow);
}
