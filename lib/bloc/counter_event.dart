import 'package:flutter/cupertino.dart';
import 'package:ui_responce/bloc/models/todos.dart';

abstract class CounterEvent {}

class Increment extends CounterEvent {
  final TodosModel item;
  Increment({Key key , @required this.item});
}

class Decrement extends CounterEvent {
  final TodosModel item;
  Decrement({Key key ,@required this.item});
}
