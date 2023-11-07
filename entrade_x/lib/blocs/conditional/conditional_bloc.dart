import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:entrade_x/other/help_func.dart';

part 'conditional_event.dart';

part 'conditional_state.dart';

class ConditionalBloc extends Bloc<ConditionalEvent, ConditionalState> {
  ConditionalBloc() : super(ConditionalInitial()) {
    on<ClickFitPriceEvent>(_click);
  }

  FutureOr<void> _click(
      ClickFitPriceEvent event, Emitter<ConditionalState> emit) {
    emit(ConditionalFitLoadingState());
    double values = money / (cellingPrice * 1000);
    emit(ConditionalFitSuccessState(event.priceFit, values));
    // print(event.priceFit);
  }
}
