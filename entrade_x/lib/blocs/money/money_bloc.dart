import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'money_event.dart';

part 'money_state.dart';

class MoneyBloc extends Bloc<MoneyEvent, MoneyState> {
  MoneyBloc() : super(ShowHideMoneyState(true)) {
    on<ShowHideMoneyEvent>(_showHideMoney);
  }

  FutureOr<void> _showHideMoney(
      ShowHideMoneyEvent event, Emitter<MoneyState> emit) {
    if (state is ShowHideMoneyState) {
      final currentState = state as ShowHideMoneyState;
      emit(ShowHideMoneyState(!currentState.isShow));
    }
  }
}
