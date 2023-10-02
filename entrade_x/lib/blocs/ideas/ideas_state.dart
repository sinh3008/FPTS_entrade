part of 'ideas_bloc.dart';

abstract class IdeasState {}

class IdeasInitial extends IdeasState {}

class IdeasLoadingState extends IdeasState {}

class IdeasSuccessState extends IdeasState {
  List<Stock> stocks;
  IdeasSuccessState(this.stocks);
}

class IdeasFalseState extends IdeasState {
  final String error;

  IdeasFalseState(this.error);
}
