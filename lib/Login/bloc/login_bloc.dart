import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_responce/Login/bloc/login_event.dart';
import 'package:ui_responce/Login/bloc/login_state.dart';
import 'dart:async';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  // TODO: implement initialState
  LoginState get initialState => null;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginClick) {
      yield* onLogin(event);
    }
  }

  Stream<LoginState> onLogin(LoginClick event) async*{
    if(event.userInfo.email == "ka@gmail.com" && event.userInfo.pass.length >= 6)
    {
      yield onSuccessfully();
    }
    else
    {
      yield onError();
    }
  }
}
