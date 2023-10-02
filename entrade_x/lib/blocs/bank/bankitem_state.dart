part of 'bankitem_bloc.dart';

abstract class BankitemState {}

class BankitemInitial extends BankitemState {}

class BankitemLoadingState extends BankitemState {}

class BankitemSuccessState extends BankitemState {
  Bank bank;

  BankitemSuccessState(this.bank);
}

class BankitemErrorState extends BankitemState {}
