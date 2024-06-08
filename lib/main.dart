import 'package:bloc_state_manage/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_state_manage/bloc/post/post_bloc.dart';
import 'package:bloc_state_manage/bloc/to_do/todo_bloc.dart';
import 'package:bloc_state_manage/ui/post/post_screen.dart';

import 'package:bloc_state_manage/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => TodoBloc()),
          BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
          BlocProvider(create: (_) => PostBloc())
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: Post_Screen()));
    //
  }
}
