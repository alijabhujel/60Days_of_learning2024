import 'package:bloc_state_manage/model/favourite_model.dart';

class FavouriteRepository {
  Future<List<FavouriteModel>> fetchItem() async {
    await Future.delayed(Duration(seconds: 3));
    return List.of(_generatedlist(10));
  }

  List<FavouriteModel> _generatedlist(int length) {
    return List.generate(length,
        (index) => FavouriteModel(id: index.toString(), value: 'Item $index'));
  }
}
