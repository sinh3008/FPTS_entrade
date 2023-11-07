part of 'conditional_bloc.dart';

abstract class ConditionalEvent {}

class ClickFitPriceEvent extends ConditionalEvent {
  double priceFit;
  double money;
  double cellingPrice;

  ClickFitPriceEvent(this.priceFit, this.money, this.cellingPrice);
}

class UpdateBuyEvent extends ConditionalEvent {
  int number;

  UpdateBuyEvent(this.number);
}
