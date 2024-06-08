import 'package:equatable/equatable.dart';

class CounterStates extends Equatable {
  final int counter;
  CounterStates({this.counter = 0});

  CounterStates copyWith({int? counter}) {
    return CounterStates(counter: counter ?? this.counter);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [counter];
}
