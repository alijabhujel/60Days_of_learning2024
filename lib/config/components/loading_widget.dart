import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyWidget extends StatefulWidget {
  final double size;
  const MyWidget({super.key, this.size = 60});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.size,
        width: widget.size,
        child: Platform.isAndroid
            ? const CircularProgressIndicator(color: Colors.blue)
            : const CupertinoActivityIndicator(color: Colors.blue));
  }
}
