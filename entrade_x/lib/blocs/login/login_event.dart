part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginAccountEvent extends LoginEvent {
  final String email;
  final String pass;
  final BuildContext context;
  LoginAccountEvent(this.email, this.pass, this.context);
}
