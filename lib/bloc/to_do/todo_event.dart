import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  // base class
  const TodoEvent();
}

class AddTodoEvent extends TodoEvent {
  final String task; // taking input from user
  AddTodoEvent({required this.task});
  @override
  // TODO: implement props
  List<Object?> get props => [task];
}

class RemoveTodoEvent extends TodoEvent {
  final Object task;
  RemoveTodoEvent({required this.task});

  @override
  // TODO: implement props
  List<Object?> get props => [task];
}
