part of 'chart_bloc.dart';

abstract class ChartEvent {}

class ChartClickItemEvent extends ChartEvent{
  final int id;

  ChartClickItemEvent({this.id = 0});
}
