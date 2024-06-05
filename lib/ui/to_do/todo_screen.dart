import 'package:bloc_state_manage/bloc/to_do/todo_bloc.dart';
import 'package:bloc_state_manage/bloc/to_do/todo_event.dart';
import 'package:bloc_state_manage/bloc/to_do/todo_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Todo_Screen extends StatefulWidget {
  const Todo_Screen({super.key});

  @override
  State<Todo_Screen> createState() => _Todo_ScreenState();
}

class _Todo_ScreenState extends State<Todo_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo list'),
      ),
      body: BlocBuilder<TodoBloc, TodoStates>(
        builder: (context, state) {
          if (state.todolist.isEmpty) {
            return const Center(
              child: Text("No list found"),
            );
          } else if (state.todolist.isNotEmpty) {
            return ListView.builder(
                itemCount: state.todolist.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        context
                            .read<TodoBloc>()
                            .add(RemoveTodoEvent(task: state.todolist[index]));
                      },
                    ),
                    title: Text(state.todolist[index]),
                  );
                });
          } else {
            return SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 10; i++) {
            context
                .read<TodoBloc>()
                .add(AddTodoEvent(task: 'Task' + i.toString()));
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
