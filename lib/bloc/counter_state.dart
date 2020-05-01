import 'package:flutter/cupertino.dart';
import 'package:ui_responce/bloc/models/todos.dart';

@immutable
abstract class CounterState {}

class getIncrement extends CounterState {
  final TodosModel wordIn;
  getIncrement(this.wordIn) :super();
  @override
  String toString() => ':${wordIn}';
}

class getDecrement extends CounterState {
   final TodosModel wordDe;
  getDecrement(this.wordDe);
  @override
  String toString() => ':${wordDe}';
}
