// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sadakyatra/Booking/input_field.dart';
import 'package:sadakyatra/Booking/provide.dart';
import 'package:sadakyatra/pages/login-page.dart';

import 'package:sadakyatra/setups.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final oldpasscontroller = TextEditingController();
  final newpasscontroller = TextEditingController();
  final newconfirmpassController = TextEditingController();
  final provider = settingProvider();
  final formkey = GlobalKey<FormState>();
  bool oldpassObsercured = true;
  bool newpassObsercured = true;
  bool newpassConfirmobsecured = true;

  Future<void> changePassword() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final uid = currentUser?.uid;
    try {
      // Fetch the email from Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('sadakyatra')
          .doc('userDetailsDatabase')
          .collection('users')
          .doc(uid)
          .get();

      String email = userDoc['email'];

      var credential = EmailAuthProvider.credential(
          email: email, password: oldpasscontroller.text);

      // Reauthenticate the user
      await currentUser?.reauthenticateWithCredential(credential);

      // Update the password
      await currentUser?.updatePassword(newconfirmpassController.text);

      // Update Firestore document
      await FirebaseFirestore.instance
          .collection('sadakyatra')
          .doc('userDetailsDatabase')
          .collection('users')
          .doc(uid)
          .update({
        'password': newconfirmpassController.text,
      });
      // await currentUser!.updatePassword(newconfirmpassController.text);
      FirebaseAuth.instance.signOut();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password updated successfully')),
      );
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login_page()));
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    oldpasscontroller.dispose();
    newpasscontroller.dispose();
    newconfirmpassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Change password'),
          centerTitle: true,
          backgroundColor: appbarcolor),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                InputField(
                  label: 'Enter old password',
                  icon: Icons.lock,
                  controller: oldpasscontroller,
                  isvisible: oldpassObsercured,
                  eyeButton: IconButton(
                    onPressed: () {
                      setState(() {
                        oldpassObsercured = !oldpassObsercured;
                      });
                    },
                    icon: Icon(oldpassObsercured
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                  validator: (value) => provider.passValidator(value),
                ),
                InputField(
                  label: 'Enter new password',
                  icon: Icons.lock,
                  controller: newpasscontroller,
                  isvisible: newpassObsercured,
                  eyeButton: IconButton(
                    onPressed: () {
                      setState(() {
                        newpassObsercured = !newpassObsercured;
                      });
                    },
                    icon: Icon(newpassObsercured
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                  validator: (value) => provider.passwordValidator(value),
                ),
                InputField(
                  label: 'Confirm password',
                  icon: Icons.lock,
                  controller: newconfirmpassController,
                  isvisible: newpassConfirmobsecured,
                  eyeButton: IconButton(
                    onPressed: () {
                      setState(() {
                        newpassConfirmobsecured = !newpassConfirmobsecured;
                      });
                    },
                    icon: Icon(newpassConfirmobsecured
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                  validator: (value) => provider.cpasswordValidator(
                      newconfirmpassController.text, newpasscontroller.text),
                ),
                SizedBox(
                  height: 10,
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            title: Text("Password must have"),
                            content: FittedBox(
                              child: Container(
                                height: 200,
                                width: 200,
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("•Minimun 8 character"),
                                    Text("• Maximum 8 Character"),
                                    Text(
                                        "•At Least one uppercase English letter [A-Z]"),
                                    Text(
                                        "•At Least one uppercase English letter [a-z]"),
                                    Text("•At least one digit [0-9]"),
                                    Text(
                                        "•At least one Special Character [@ # & ? % ^ .]"),
                                  ],
                                ),
                              ),
                            ));
                      },
                    );
                  },
                  icon: Icon(Icons.privacy_tip_outlined),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        await changePassword();
                      } else {}
                    },
                    child: Text(
                      'Change password',
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
