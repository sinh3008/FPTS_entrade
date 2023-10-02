import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:entrade_x/models/stock.dart';
import 'package:entrade_x/repo/stocks.dart';

part 'ideas_event.dart';
part 'ideas_state.dart';

class IdeasBloc extends Bloc<IdeasEvent, IdeasState> {
  IdeasBloc() : super(IdeasInitial()) {
    on<IdeasEvent>(_showIdeas);
  }

  FutureOr<void> _showIdeas(IdeasEvent event, Emitter<IdeasState> emit) {
    emit(IdeasLoadingState());
    List<Stock> list = Stocks().list;
    if (list.isNotEmpty) {
      emit(IdeasSuccessState(list));
    } else {
      emit(IdeasFalseState('error'));
    }
  }
}
