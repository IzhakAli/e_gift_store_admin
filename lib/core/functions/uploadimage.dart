import 'dart:io';

import 'package:image_picker/image_picker.dart';

final ImagePicker _picker = ImagePicker(); // Add this line
Future<File?> imageUploadCamera() async {
  try {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
  } catch (e) {
    print(e);
  }
  return null;
}

Future<File?> imageUploadGallery() async {
  try {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
  } catch (e) {
    print(e);
  }
  return null;
}
