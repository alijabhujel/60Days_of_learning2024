import 'package:equatable/equatable.dart';

class TodoStates extends Equatable {
  final List<String> todolist;
  const TodoStates({this.todolist = const []});

  TodoStates copyWith({List<String>? todolist}) {
    return TodoStates(todolist: todolist ?? this.todolist);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [todolist];
}
