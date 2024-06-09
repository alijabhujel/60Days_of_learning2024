import 'package:equatable/equatable.dart';

class FavouriteModel extends Equatable {
  final String id;
  final String value;
  final bool isDeleting;
  final bool isFavourite;

  FavouriteModel(
      {required this.id,
      required this.value,
      this.isDeleting = false,
      this.isFavourite = false});

// making instance for favourite model whuch is a copywith function in which if the value is null pass the same value which is in initial state.
  FavouriteModel copyWith(
      {String? id, String? value, bool? isDeleting, bool? isFavourite}) {
    return FavouriteModel(
        id: id ?? this.id,
        value: value ?? this.value,
        isDeleting: isDeleting ?? this.isDeleting,
        isFavourite: isFavourite ?? this.isFavourite);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, value, isDeleting, isFavourite];
}
