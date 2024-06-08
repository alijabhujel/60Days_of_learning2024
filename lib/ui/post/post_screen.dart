import 'package:bloc_state_manage/bloc/post/post_bloc.dart';
import 'package:bloc_state_manage/bloc/post/post_event.dart';
import 'package:bloc_state_manage/bloc/post/post_states.dart';
import 'package:bloc_state_manage/utils/enum_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Post_Screen extends StatefulWidget {
  const Post_Screen({super.key});

  @override
  State<Post_Screen> createState() => _Post_ScreenState();
}

class _Post_ScreenState extends State<Post_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostBloc>().add(PostFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts_APIS status'),
      ),
      body: BlocBuilder<PostBloc, PostStates>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.loading:
              return CircularProgressIndicator();
            case PostStatus.failure:
              return Text(state.message.toString());
            case PostStatus.success:
              return ListView.builder(
                  itemCount: state.postList.length,
                  itemBuilder: (context, index) {
                    final item = state.postList[index];
                    return ListTile(
                      title: Text(item.email.toString()),
                      subtitle: Text(item.body.toString()),
                    );
                  });
          }
        },
      ),
    );
  }
}
