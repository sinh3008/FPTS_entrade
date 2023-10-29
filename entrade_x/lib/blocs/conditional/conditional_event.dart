part of 'conditional_bloc.dart';

abstract class ConditionalEvent {}

class ClickFitPriceEvent extends ConditionalEvent {
  double priceFit;

  ClickFitPriceEvent(this.priceFit);
}

class UpdateBuyEvent extends ConditionalEvent {
  double? quantity;
  double? setPrice;

  UpdateBuyEvent(this.quantity, this.setPrice);
}
