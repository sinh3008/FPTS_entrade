part of 'chart_bloc.dart';

abstract class ChartState {}

class ChartInitial extends ChartState {}

class ChartLoadingState extends ChartState {}

class ChartSuccessState extends ChartState {
  final List<FlSpot> list;

  ChartSuccessState(this.list);
}

class CharErrorState extends ChartState {}
