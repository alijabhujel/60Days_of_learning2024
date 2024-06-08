import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  CounterEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class incrementcounter extends CounterEvent {}

class decrementcounter extends CounterEvent {}
