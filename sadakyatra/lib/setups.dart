// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

const backgroundColor = Color(0xFFF9FAFB);
const textcolor = Color(0xFF9C07E6);
const appbarcolor = Color(0xFF8A55DF);
const appbarfontcolor = Color(0xFFF9F8F9);

const TextStyle textStyle = TextStyle(
  color: textcolor,
  fontSize: 20,
  fontWeight: FontWeight.w500,
);
const TextStyle textStyleappbar = TextStyle(
  color:appbarfontcolor,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);


Future<File?> PickImageFromGallery(BuildContext contex) async {
  File? image;
  try {
    final Pickimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (Pickimage != null) {
      image = File(Pickimage.path);
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return image;
}
