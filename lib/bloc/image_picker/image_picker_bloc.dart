import 'package:bloc_state_manage/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_state_manage/bloc/image_picker/image_picker_states.dart';
import 'package:bloc_state_manage/utils/image_picker_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerStates> {
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(ImagePickerStates()) {
    // initialize the state
    on<CameraCapture>(cameraCapture);
  }

  void cameraCapture(
      CameraCapture event, Emitter<ImagePickerStates> states) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }
}
