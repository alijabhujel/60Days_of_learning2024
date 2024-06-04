import 'package:equatable/equatable.dart';

abstract class ImagePickerEvent extends Equatable {
  //provide interface // Base class

  const ImagePickerEvent(); // made constructor
  @override
  List<Object> get props => [];
}

class CameraCapture extends ImagePickerEvent {}

class GalleryPicker extends ImagePickerEvent {}
