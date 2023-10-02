part of 'bankitem_bloc.dart';

abstract class BankitemEvent {}
class BankClickedItemEvent extends BankitemEvent{
  final int id;

  BankClickedItemEvent(this.id);
}
