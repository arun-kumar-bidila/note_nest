import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

Future<File?> pickVideoFile() async {
  FilePickerResult? result =
      await FilePicker.platform.pickFiles(type: FileType.video);
  if (result != null) {
    return File(result.files.single.path!);
  }
  return null;
}
