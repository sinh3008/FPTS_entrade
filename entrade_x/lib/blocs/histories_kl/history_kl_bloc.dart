import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'history_kl_event.dart';
part 'history_kl_state.dart';

class HistoryKlBloc extends Bloc<HistoryKlEvent, HistoryKlState> {
  HistoryKlBloc() : super(HistoryKlInitial()) {
    on<HistoryKlEvent>((event, emit) {});
  }
}
