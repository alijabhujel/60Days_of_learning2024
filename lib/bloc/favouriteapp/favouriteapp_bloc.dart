import 'package:bloc_state_manage/bloc/favouriteapp/favouriteapp_events.dart';
import 'package:bloc_state_manage/bloc/favouriteapp/favouriteapp_states.dart';
import 'package:bloc_state_manage/model/favourite_model.dart';
import 'package:bloc_state_manage/repository/favourite_repository.dart';
import 'package:bloc_state_manage/utils/enum_favourite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteappBloc extends Bloc<FavouriteappEvents, FavouriteappStates> {
  List<FavouriteModel> favouritelist = [];
  FavouriteRepository favouriteRepository;

  FavouriteappBloc(this.favouriteRepository) : super(FavouriteappStates()) {
    on<fetchFavouriteList>(fetchList);
    on<favouriteitem>(_addfavouriteitem);
  }
  void fetchList(
      fetchFavouriteList event, Emitter<FavouriteappStates> emit) async {
    favouritelist = await favouriteRepository.fetchItem();
    emit(state.copyWith(
        favouritemodel: List.from(favouritelist),
        favouritestatus: Favouritestatus.success));
  }

  void _addfavouriteitem(
      favouriteitem event, Emitter<FavouriteappStates> emit) async {}
}
