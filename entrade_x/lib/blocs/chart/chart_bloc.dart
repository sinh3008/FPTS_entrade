import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:entrade_x/repo/fake_data_chart.dart';
import 'package:fl_chart/fl_chart.dart';

part 'chart_event.dart';

part 'chart_state.dart';

class ChartBloc extends Bloc<ChartEvent, ChartState> {
  ChartBloc() : super(ChartInitial()) {
    on<ChartEvent>((event, emit) {});
    on<ChartClickItemEvent>(_loadChartById);
  }

  FutureOr<void> _loadChartById(ChartClickItemEvent event,
      Emitter<ChartState> emit) async {
    emit(ChartLoadingState());
    List<FlSpot> list =  FakeData().getChart(event.id);
    if(list.isNotEmpty){
      emit(ChartSuccessState(list));
    }else{
      emit(CharErrorState());
    }
  }
}
