import 'package:bloc_state_manage/model/post_model.dart';
import 'package:bloc_state_manage/utils/enum_post.dart';
import 'package:equatable/equatable.dart';

class PostStates extends Equatable {
  final PostStatus postStatus; //to check where it is success or not from enum
  final List<PostModel> postList; // the api model are in list
  final String message; // message for if api is not hit

  PostStates(
      {this.postStatus = PostStatus.loading,
      this.postList = const <PostModel>[],
      this.message = ''});

  PostStates copyWith(
      {PostStatus? postStatus, List<PostModel>? postList, String? message}) {
    return PostStates(
        postStatus: postStatus ?? this.postStatus,
        postList: postList ?? this.postList,
        message: message ?? this.message);
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
