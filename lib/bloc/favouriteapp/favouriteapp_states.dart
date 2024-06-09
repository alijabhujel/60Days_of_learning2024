import 'package:bloc_state_manage/model/favourite_model.dart';
import 'package:bloc_state_manage/utils/enum_favourite.dart';
import 'package:equatable/equatable.dart';

class FavouriteappStates extends Equatable {
  final Favouritestatus favouritestatus;
  final List<FavouriteModel> favouritemodel;
  const FavouriteappStates(
      {this.favouritemodel = const [],
      this.favouritestatus = Favouritestatus.loading});

  FavouriteappStates copyWith(
      {Favouritestatus? favouritestatus,
      List<FavouriteModel>? favouritemodel}) {
    return FavouriteappStates(
        favouritemodel: favouritemodel ?? this.favouritemodel,
        favouritestatus: favouritestatus ?? this.favouritestatus);
  }

  @override
  List<Object> get props => [favouritestatus, favouritemodel];
}
