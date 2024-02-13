import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class AppImagePicker {
  final ImagePicker _imagePicker;

  static final AppImagePicker _instance = AppImagePicker._();

  AppImagePicker._() : _imagePicker = ImagePicker();

  factory AppImagePicker() => _instance;

  Future<List<Uint8List>> pickMultipleImages({
    double maxWidth = 1024,
    double maxHeight = 1024,
    int imageQuality = 85,
  }) async {
    final imageFiles = await _imagePicker.pickMultiImage(
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      imageQuality: imageQuality,
      requestFullMetadata: false,
    );

    return await Future.wait(
      imageFiles.map((f) => f.readAsBytes()),
      eagerError: true,
    );
  }
}
