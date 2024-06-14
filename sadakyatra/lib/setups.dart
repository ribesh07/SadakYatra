// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

const backgroundColor = Color.fromARGB(255, 225, 203, 233);
const textcolor = Color.fromARGB(255, 17, 16, 17);
const appbarcolor = Color.fromARGB(255, 168, 106, 231);
const appbarfontcolor = Color.fromARGB(255, 17, 16, 17);

const TextStyle textStyle = TextStyle(
  color: textcolor,
  fontSize: 20,
  fontWeight: FontWeight.w500,
);
const TextStyle textStyleappbar = TextStyle(
  color: appbarfontcolor,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

const TextStyle dropDownTextStyle =
    TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500);

TextStyle dropDownFirststyle = TextStyle(
  fontStyle: FontStyle.italic,
  color: Colors.black.withOpacity(0.6),
  fontSize: 20,
);

const buttonColor = Colors.blue;
const buttonStyle = TextStyle(
    fontSize: 15,
    color: Color.fromARGB(255, 0, 140, 255),
    fontWeight: FontWeight.w700);
const textSize = TextStyle(fontSize: 18);
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

Card CustomTextButton(String buttonName, Onpressed()) {
  return Card(
    color: Color.fromARGB(255, 154, 199, 236),
    child: TextButton(
      onPressed: Onpressed,
      child: Text(
        buttonName,
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
    ),
  );
}
