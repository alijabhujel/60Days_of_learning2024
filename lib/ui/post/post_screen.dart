import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Post_Screen extends StatefulWidget {
  const Post_Screen({super.key});

  @override
  State<Post_Screen> createState() => _Post_ScreenState();
}

class _Post_ScreenState extends State<Post_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts_API'),
      ),
    );
  }
}
