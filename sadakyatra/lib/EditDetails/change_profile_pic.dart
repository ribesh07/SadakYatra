// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sadakyatra/setups.dart';

class changeProfilePic extends StatefulWidget {
  const changeProfilePic({super.key});

  @override
  State<changeProfilePic> createState() => _changeProfilePicState();
}

class _changeProfilePicState extends State<changeProfilePic> {
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final cpasscontroller = TextEditingController();
  final usernamecontroller = TextEditingController();
  final contactnumcontroller = TextEditingController();
  File? image;
  void selectImage() async {
    image = await PickImageFromGallery(context);
    setState(() {});
  }

  // void storeUserData() async {
  //   String email = emailcontroller.text.trim();
  //   String password = passcontroller.text.trim();
  //   String cpassword = cpasscontroller.text.trim();
  //   String username = usernamecontroller.text.trim();
  //   String contactnum = contactnumcontroller.text.trim();

  //   if (image != null) {
  //     if (password == cpassword) {
  //       if (email.isNotEmpty && password.isNotEmpty) {
  //         // ref
  //         //     .read(authControllerProvider)
  //         //     .saveUserDataToFirebase(context, name, email, password, image);
  //       }
  //     }
  //   }
  // }

  @override
  void dispose() {
    emailcontroller.dispose();
    // passcontroller.dispose();
    // cpasscontroller.dispose();
    usernamecontroller.dispose();
    contactnumcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Profile Pic',
          style: textStyleappbar,
        ),
        backgroundColor: Color.fromARGB(255, 205, 225, 243),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Stack(
              children: [
                image != null
                    ? CircleAvatar(
                        backgroundImage: FileImage(image!),
                        radius: 46,
                        // child: Icon(
                        //   Icons.person,
                        //   size: 50,
                        // )
                      )
                    : CircleAvatar(
                        backgroundColor: appbarcolor,
                        radius: 46,
                        child: GestureDetector(
                          onTap: selectImage,
                          child: const Icon(
                            Icons.person,
                            size: 50,
                          ),
                        ),
                      ),
                if (image == null)
                  Positioned(
                    bottom: -6,
                    right: -10,
                    child: IconButton(
                      onPressed: () {
                        selectImage();
                      },
                      icon: const Icon(
                        Icons.add_a_photo_outlined,
                        size: 30,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 26,
            ),
            image == null
                ? const Text(
                    'Add Image',
                    style: textStyle,
                  )
                : const Text(
                    'Your Image',
                    style: textStyle,
                  ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
