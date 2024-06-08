import 'package:bloc_state_manage/bloc/counter/counter_bloc.dart';
import 'package:bloc_state_manage/bloc/counter/counter_event.dart';
import 'package:bloc_state_manage/bloc/counter/counter_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter_Screen extends StatefulWidget {
  const Counter_Screen({super.key});

  @override
  State<Counter_Screen> createState() => _Counter_ScreenState();
}

class _Counter_ScreenState extends State<Counter_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter_Screen'),
      ),
      body: Column(
        children: [
          BlocBuilder<CounterBloc, CounterStates>(builder: (context, state) {
            return Text(state.counter.toString());
          }),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(incrementcounter());
                  },
                  child: Text('Increment')),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(decrementcounter());
                  },
                  child: Text('Decrement'))
            ],
          )
        ],
      ),
    );
  }
}
