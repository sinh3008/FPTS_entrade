part of 'conditional_bloc.dart';

abstract class ConditionalState {}

class ConditionalInitial extends ConditionalState {}

class ConditionalSuccessState extends ConditionalState {
  bool isActive;
  ConditionalSuccessState(this.isActive);
}

class ConditionalFitLoadingState extends ConditionalState {}

class ConditionalFitSuccessState extends ConditionalState {
  double priceFit;
  double number;

  ConditionalFitSuccessState(this.priceFit, this.number);
}

class UpdateBuyLoadingState extends ConditionalState{

}
