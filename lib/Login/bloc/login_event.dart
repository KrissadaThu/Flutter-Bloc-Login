import 'package:flutter/cupertino.dart';
import 'package:ui_responce/Login/Models/loginModel.dart';

abstract class LoginEvent{}
class LoginClick extends LoginEvent
{
  final LoginModel userInfo;
  LoginClick({Key key , @required this.userInfo});
}