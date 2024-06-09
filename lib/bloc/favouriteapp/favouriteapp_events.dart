import 'package:bloc_state_manage/model/favourite_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavouriteappEvents extends Equatable {
  const FavouriteappEvents();

  @override
  List<Object> get props => [];
}

class fetchFavouriteList extends FavouriteappEvents {}

class favouriteitem extends FavouriteappEvents {
  final FavouriteModel item;

  favouriteitem({required this.item});
}
