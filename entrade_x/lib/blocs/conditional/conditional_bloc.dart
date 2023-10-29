import 'dart:async';
import 'package:bloc/bloc.dart';

part 'conditional_event.dart';
part 'conditional_state.dart';

class ConditionalBloc extends Bloc<ConditionalEvent, ConditionalState> {
  ConditionalBloc() : super(ConditionalInitial()) {
    on<ClickFitPriceEvent>(_click);
  }

  FutureOr<void> _click(
      ClickFitPriceEvent event, Emitter<ConditionalState> emit) {
    emit(ConditionalFitLoadingState());
    emit(ConditionalFitSuccessState(event.priceFit));
  }
}
