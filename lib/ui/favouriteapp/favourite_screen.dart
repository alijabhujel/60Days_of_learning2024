import 'package:bloc_state_manage/bloc/favouriteapp/favouriteapp_bloc.dart';
import 'package:bloc_state_manage/bloc/favouriteapp/favouriteapp_events.dart';
import 'package:bloc_state_manage/bloc/favouriteapp/favouriteapp_states.dart';
import 'package:bloc_state_manage/utils/enum_favourite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favourite_Screen extends StatefulWidget {
  const Favourite_Screen({super.key});

  @override
  State<Favourite_Screen> createState() => _Favourite_ScreenState();
}

class _Favourite_ScreenState extends State<Favourite_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavouriteappBloc>().add(fetchFavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Screen'),
      ),
      body: BlocBuilder<FavouriteappBloc, FavouriteappStates>(
        builder: (context, state) {
          switch (state.favouritestatus) {
            case Favouritestatus.loading:
              return CircularProgressIndicator();
            case Favouritestatus.failure:
              return Text('something went wrong');
            case Favouritestatus.success:
              return ListView.builder(
                  itemCount: state.favouritemodel.length,
                  itemBuilder: (context, index) {
                    final item = state.favouritemodel[index];
                    return Card(
                      child: ListTile(
                        title: Text(item.value.toString()),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_outline)),
                      ),
                    );
                  });
          }
        },
      ),
    );
  }
}
