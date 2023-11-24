import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../ui/screen/home/home_screen.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});
    on<LoginAccountEvent>(_loginAccount);
  }

  FutureOr<void> _loginAccount(LoginAccountEvent event,
      Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    if(event.email == 'admin' && event.pass == 'admin'){
      emit(LoginSuccessState());
      Navigator.pushNamed(event.context, HomeScreen.routeName);
      Navigator.pushReplacementNamed(event.context, HomeScreen.routeName);
    }else{
      emit(LoginFalseState('Lỗi'));
    }
  }
}
