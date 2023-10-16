part of 'conditional_bloc.dart';

abstract class ConditionalEvent {}

class ClickFitPriceEvent extends ConditionalEvent {
  double priceFit;
  ClickFitPriceEvent(this.priceFit);
}
