import 'package:bloc_state_manage/bloc/counter/counter_event.dart';
import 'package:bloc_state_manage/bloc/counter/counter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterStates> {
  CounterBloc() : super(CounterStates()) {
    on<incrementcounter>(increment);
    on<decrementcounter>(decrement);
  }

  void increment(incrementcounter event, Emitter<CounterStates> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void decrement(decrementcounter event, Emitter<CounterStates> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
