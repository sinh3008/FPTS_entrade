part of 'conditional_bloc.dart';

abstract class ConditionalState {}

class ConditionalInitial extends ConditionalState {}

class ConditionalSuccessState extends ConditionalState {
  bool isAbility;
  int number;

  ConditionalSuccessState(this.isAbility, this.number);
}

class ConditionalFitLoadingState extends ConditionalState {}

class ConditionalFitSuccessState extends ConditionalState {
  double priceFit;

  ConditionalFitSuccessState(this.priceFit);
}
