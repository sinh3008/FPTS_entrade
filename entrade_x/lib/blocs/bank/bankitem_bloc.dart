import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../models/bank.dart';
import '../../repo/banks.dart';

part 'bankitem_event.dart';

part 'bankitem_state.dart';

class BankitemBloc extends Bloc<BankitemEvent, BankitemState> {
  BankitemBloc() : super(BankitemInitial()) {
    on<BankitemEvent>((event, emit) {});
    on<BankClickedItemEvent>(_loadBankById);
  }

  FutureOr<void> _loadBankById(
      BankClickedItemEvent event, Emitter<BankitemState> emit) {
    emit(BankitemLoadingState());
    Banks banks = Banks();
    List<Bank> list = banks.list;
    Bank bank = list[event.id];
    // ignore: unnecessary_null_comparison
    if (bank != null) {
      emit(BankitemSuccessState(bank));
    } else {
      emit(BankitemErrorState());
    }
  }
}
