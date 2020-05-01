import 'package:flutter/cupertino.dart';

@immutable
abstract class LoginState {}

class onSuccessfully extends LoginState {
  @override
  String toString() => "Login Successfully...";
}

class onError extends LoginState {
  @override
  String toString() => "Password Faild";
}
