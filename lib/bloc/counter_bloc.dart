import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_responce/bloc/counter_event.dart';
import 'dart:async';

import 'package:ui_responce/bloc/counter_state.dart';
import 'package:ui_responce/bloc/models/todos.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final _hello = 'HELLO';
   final item = TodosModel(id: 0 ,name: 'snake');
  @override
  CounterState get initialState => getDecrement(item);

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is Increment) {
      yield getIncrement((event.item as TodosModel ));
    } else if (event is Decrement) {
      yield getDecrement((event.item as TodosModel ));
    }
  }
}
