import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:entrade_x/repo/banks.dart';

import '../../models/bank.dart';

part 'bank_event.dart';

part 'bank_state.dart';

class BankBloc extends Bloc<BankEvent, BankState> {
  BankBloc() : super(BankInitial()) {
    on<BankEvent>((event, emit) {});
    on<BankLoadAllEvent>(_loadBank);
  }

  FutureOr<void> _loadBank(BankLoadAllEvent event, Emitter<BankState> emit) {
    Banks banks = Banks();
    List<Bank> list = banks.list;
    emit(BankLoadingState());
    if (list.isNotEmpty) {
      emit(BankSuccessState(list));
    } else {
      emit(BankErrorState());
    }
  }
}
