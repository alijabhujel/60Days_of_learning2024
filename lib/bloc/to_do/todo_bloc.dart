import 'package:bloc_state_manage/bloc/to_do/todo_event.dart';
import 'package:bloc_state_manage/bloc/to_do/todo_states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoStates> {
  final List<String> todoLists = [];
  TodoBloc() : super(TodoStates()) {
    on<AddTodoEvent>(_addTodoevent);
    on<RemoveTodoEvent>(_removeTodoevent);
  }

  void _addTodoevent(AddTodoEvent event, Emitter<TodoStates> emit) {
    todoLists.add(event.task);
    emit(state.copyWith(todolist: List.from(todoLists)));
  }

  void _removeTodoevent(RemoveTodoEvent event, Emitter<TodoStates> emit) {
    todoLists.remove(event.task);
    emit(state.copyWith(todolist: List.from(todoLists)));
  }
}
