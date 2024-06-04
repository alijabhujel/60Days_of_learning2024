import 'dart:io';

import 'package:bloc_state_manage/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_state_manage/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_state_manage/bloc/image_picker/image_picker_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Image_picker extends StatefulWidget {
  const Image_picker({super.key});

  @override
  State<Image_picker> createState() => _Image_pickerState();
}

class _Image_pickerState extends State<Image_picker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image_picker_bloc"),
      ),
      body: BlocBuilder<ImagePickerBloc, ImagePickerStates>(
          builder: (context, state) {
        if (state.file == null) {
          return InkWell(
            onTap: () {
              context.read<ImagePickerBloc>().add(CameraCapture());
            },
            child: CircleAvatar(
              child: Icon(Icons.camera),
            ),
          );
        } else {
          return Image.file(File(state.file!.path.toString()));
        }
      }),
    );
  }
}
