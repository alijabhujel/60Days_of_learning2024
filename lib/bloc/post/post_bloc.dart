import 'package:bloc_state_manage/bloc/post/post_event.dart';
import 'package:bloc_state_manage/bloc/post/post_states.dart';
import 'package:bloc_state_manage/repository/post_repository.dart';
import 'package:bloc_state_manage/utils/enum_post.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostStates> {
  Postrepository postrepository = Postrepository();
  PostBloc() : super(PostStates()) {
    on<PostFetch>(postFetchApi);
  }

  void postFetchApi(PostFetch event, Emitter<PostStates> emit) {
    postrepository.fetchPost().then((value) {
      emit(state.copyWith(
          postStatus: PostStatus.success, message: 'success', postList: value));
    }).onError((error, StackTrace) {
      emit(state.copyWith(
          postStatus: PostStatus.failure, message: error.toString()));
    });
  }
}
