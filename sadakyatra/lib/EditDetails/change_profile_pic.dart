// // ignore_for_file: prefer_const_constructors, unused_local_variable, curly_braces_in_flow_control_structures, avoid_print, use_build_context_synchronously

// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:sadakyatra/setups.dart';

// // ignore: camel_case_types
// class changeProfilePic extends StatefulWidget {
//   const changeProfilePic({super.key});

//   @override
//   State<changeProfilePic> createState() => _changeProfilePicState();
// }

// // ignore: camel_case_types
// class _changeProfilePicState extends State<changeProfilePic> {
//   final ImagePicker _picker = ImagePicker();
//   File? _image;
//   // void selectImage() async {
//   //   image = await PickImageFromGallery(context);
//   //   setState(() {});
//   // }

//   void selectImage() async {
//     final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedImage != null) {
//       setState(() {
//         _image = File(pickedImage.path);
//       });
//     }
//   }

//   Future<String?> _uploadImage(File image) async {
//     try {
//       final storageRef = FirebaseStorage.instance
//           .ref()
//           .child('user_images')
//           .child('${DateTime.now().toIso8601String()}.jpg');
//       final uploadTask = storageRef.putFile(image);
//       final snapshot = await uploadTask;
//       final downloadUrl = await snapshot.ref.getDownloadURL();
//       return downloadUrl;
//     } catch (e) {
//       print('Error uploading image: $e');
//       return null;
//     }
//   }

//   Future<void> _updateProfilePic() async {
//     if (_image == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           backgroundColor: Color.fromARGB(255, 232, 13, 13),
//           elevation: 10,
//           duration: Duration(milliseconds: 3000),
//           content: const Text(
//             "Please Select Image",
//             style: TextStyle(fontSize: 20),
//           ),
//         ),
//       );

//       return;
//     }

//     try {
//       // Get current user ID
//       User? user = FirebaseAuth.instance.currentUser;
//       if (user == null) {
//         throw Exception('User not logged in');
//       }

//       String uid = user.uid;

//       // Get current image URL from Firestore
//       DocumentSnapshot snapshot = await FirebaseFirestore.instance
//           .collection("sadakyatra")
//           .doc("userDetailsDatabase")
//           .collection("users")
//           .doc(uid)
//           .get();
//       String? oldImageUrl = snapshot['imageUrl'];

//       // Upload the new image and get the URL
//       final newImageUrl = await _uploadImage(_image!);

//       if (newImageUrl != null) {
//         // Delete the old image
//         if (oldImageUrl != null) {
//           try {
//             final oldImageRef =
//                 FirebaseStorage.instance.refFromURL(oldImageUrl);
//             await oldImageRef.delete();
//           } catch (e) {
//             print('Error deleting old image: $e');
//           }
//         }

//         // Update Firestore with the new image URL
//         await FirebaseFirestore.instance
//             .collection("sadakyatra")
//             .doc("userDetailsDatabase")
//             .collection("users")
//             .doc(uid)
//             .update({
//           'imageUrl': newImageUrl,
//         });

//         // Show success message
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             backgroundColor: Colors.green,
//             elevation: 10,
//             duration: Duration(milliseconds: 3000),
//             content: const Text(
//               "Profile Pic Updated",
//               style: TextStyle(fontSize: 20),
//             ),
//           ),
//         );
//         Future.delayed(Duration(seconds: 2), () {
//           Navigator.pop(context);
//           Navigator.pop(context);
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             backgroundColor: Color.fromARGB(255, 232, 13, 13),
//             elevation: 10,
//             duration: Duration(milliseconds: 3000),
//             content: const Text(
//               "Failed to upload new image",
//               style: TextStyle(fontSize: 20),
//             ),
//           ),
//         );
//       }
//     } catch (e) {
//       print('Error updating profile pic: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           backgroundColor: Color.fromARGB(255, 232, 13, 13),
//           elevation: 10,
//           duration: Duration(milliseconds: 3000),
//           content: const Text(
//             "Error updating profile pic",
//             style: TextStyle(fontSize: 20),
//           ),
//         ),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Change Profile Pic'),
//         centerTitle: true,
//         backgroundColor: appbarcolor,
//       ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: double.infinity,
//         color: Colors.white,
//         child: SingleChildScrollView(
//           physics: BouncingScrollPhysics(
//             parent: AlwaysScrollableScrollPhysics(),
//           ),
//           child: Column(
//             children: [
//               const SizedBox(height: 100),
//               FittedBox(
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     _image != null
//                         ? CircleAvatar(
//                             backgroundImage: FileImage(_image!),
//                             radius: 80,
//                           )
//                         : CircleAvatar(
//                             backgroundColor: appbarcolor,
//                             radius: 80,
//                             child: GestureDetector(
//                               onTap: selectImage,
//                               child: const Icon(
//                                 Icons.person,
//                                 size: 90,
//                               ),
//                             ),
//                           ),
//                     if (_image == null)
//                       Positioned(
//                         bottom: -6,
//                         right: -8,
//                         child: IconButton(
//                           onPressed: selectImage,
//                           icon: const Icon(
//                             Icons.add_a_photo_outlined,
//                             size: 40,
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 26),
//               _image == null
//                   ? const Text(
//                       'Add profile pic',
//                       style: TextStyle(fontSize: 25),
//                     )
//                   : const Text(
//                       'Your Image',
//                       style: textStyle,
//                     ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _updateProfilePic,
//                 child: Text('Save Changes'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors, unused_local_variable, curly_braces_in_flow_control_structures, avoid_print, use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sadakyatra/setups.dart';

// ignore: camel_case_types
class changeProfilePic extends StatefulWidget {
  const changeProfilePic({super.key});

  @override
  State<changeProfilePic> createState() => _changeProfilePicState();
}

// ignore: camel_case_types
class _changeProfilePicState extends State<changeProfilePic> {
  final ImagePicker _picker = ImagePicker();
  File? _image;

  void selectImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<String?> _uploadImage(File image) async {
    try {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('user_images')
          .child('${DateTime.now().toIso8601String()}.jpg');
      final uploadTask = storageRef.putFile(image);
      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  Future<void> _updateProfilePic() async {
    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color.fromARGB(255, 232, 13, 13),
          elevation: 10,
          duration: Duration(milliseconds: 3000),
          content: const Text(
            "Please Select Image",
            style: TextStyle(fontSize: 20),
          ),
        ),
      );

      return;
    }

    try {
      // Get current user ID
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('User not logged in');
      }

      String uid = user.uid;

      // Get current image URL from Firestore
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection("sadakyatra")
          .doc("userDetailsDatabase")
          .collection("users")
          .doc(uid)
          .get();
      // String? oldImageUrl = snapshot.data()?['imageUrl'];
      // Safely extract the imageUrl field
      String? oldImageUrl;
      if (snapshot.exists) {
        var data = snapshot.data() as Map<String, dynamic>?;
        oldImageUrl = data?['imageUrl'] as String?;
      }

      // Upload the new image and get the URL
      final newImageUrl = await _uploadImage(_image!);

      if (newImageUrl != null) {
        // Delete the old image if it exists
        if (oldImageUrl != null && oldImageUrl.isNotEmpty) {
          try {
            final oldImageRef =
                FirebaseStorage.instance.refFromURL(oldImageUrl);
            await oldImageRef.delete();
          } catch (e) {
            print('Error deleting old image: $e');
          }
        }

        // Update Firestore with the new image URL
        await FirebaseFirestore.instance
            .collection("sadakyatra")
            .doc("userDetailsDatabase")
            .collection("users")
            .doc(uid)
            .update({
          'imageUrl': newImageUrl,
        });

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            elevation: 10,
            duration: Duration(milliseconds: 3000),
            content: const Text(
              "Profile Pic Updated",
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
        Future.delayed(Duration(seconds: 2), () {
          Navigator.pop(context);
          Navigator.pop(context);
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Color.fromARGB(255, 232, 13, 13),
            elevation: 10,
            duration: Duration(milliseconds: 3000),
            content: const Text(
              "Failed to upload new image",
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      }
    } catch (e) {
      print('Error updating profile pic: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color.fromARGB(255, 232, 13, 13),
          elevation: 10,
          duration: Duration(milliseconds: 3000),
          content: const Text(
            "Error updating profile pic",
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Profile Pic'),
        centerTitle: true,
        backgroundColor: appbarcolor,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Column(
            children: [
              const SizedBox(height: 100),
              FittedBox(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    _image != null
                        ? CircleAvatar(
                            backgroundImage: FileImage(_image!),
                            radius: 80,
                          )
                        : CircleAvatar(
                            backgroundColor: appbarcolor,
                            radius: 80,
                            child: GestureDetector(
                              onTap: selectImage,
                              child: const Icon(
                                Icons.person,
                                size: 90,
                              ),
                            ),
                          ),
                    if (_image == null)
                      Positioned(
                        bottom: -6,
                        right: -8,
                        child: IconButton(
                          onPressed: selectImage,
                          icon: const Icon(
                            Icons.add_a_photo_outlined,
                            size: 40,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 26),
              _image == null
                  ? const Text(
                      'Add profile pic',
                      style: TextStyle(fontSize: 25),
                    )
                  : const Text(
                      'Your Image',
                      style: textStyle,
                    ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateProfilePic,
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
