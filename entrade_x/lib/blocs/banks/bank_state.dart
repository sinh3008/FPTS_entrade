part of 'bank_bloc.dart';

abstract class BankState {}

class BankInitial extends BankState {}

class BankLoadingState extends BankState {}

class BankSuccessState extends BankState {
  List<Bank> list;

  BankSuccessState(this.list);
}

class BankErrorState extends BankState {}
