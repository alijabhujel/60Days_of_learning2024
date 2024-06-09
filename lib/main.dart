import 'package:bloc_state_manage/bloc/counter/counter_bloc.dart';
import 'package:bloc_state_manage/bloc/favouriteapp/favouriteapp_bloc.dart';
import 'package:bloc_state_manage/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_state_manage/bloc/post/post_bloc.dart';
import 'package:bloc_state_manage/bloc/to_do/todo_bloc.dart';
import 'package:bloc_state_manage/repository/favourite_repository.dart';
import 'package:bloc_state_manage/ui/favouriteapp/favourite_screen.dart';
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
          BlocProvider(create: (_) => PostBloc()),
          BlocProvider(create: (_) => CounterBloc()),
          BlocProvider(create: (_) => FavouriteappBloc((FavouriteRepository())))
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: Favourite_Screen()));
    //
  }
}
