// ignore_for_file: camel_case_types, prefer_const_constructors, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sadakyatra/Booking/input_field.dart';
import 'package:sadakyatra/Booking/provide.dart';
import 'package:sadakyatra/pages/ForgotPassword.dart';
import 'package:sadakyatra/pages/botton_nav_bar.dart';
import 'package:sadakyatra/pages/setups/snackbar_message.dart';
import 'package:sadakyatra/pages/signup-page.dart';
import 'package:sadakyatra/setups.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  bool passObsecure = true;
  final provider = settingProvider();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  login(String email, String password) async {
    UserCredential? usercredential;
    try {
      usercredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => BottomBar())));
      _storePassword();
    } on FirebaseAuthException catch (e) {
      showSnackBarMsg(
          // ignore: use_build_context_synchronously
          context: context,
          message: e.toString(),
          bgColor: Colors.red);
    }
  }

  Future<void> _storePassword() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final uid = currentUser?.uid;

    try {
      // Update Firestore document
      await FirebaseFirestore.instance
          .collection('sadakyatra')
          .doc('userDetailsDatabase')
          .collection('users')
          .doc(uid)
          .update({
        'password': passcontroller.text,
      });
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passcontroller.dispose();
    // cpasscontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Page',
        ),
        backgroundColor: appbarcolor,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const CircleAvatar(
                    backgroundColor: appbarcolor,
                    radius: 46,
                    child: Icon(
                      Icons.person,
                      size: 50,
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  const Text(
                    'Your Creditinals',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 10, left: 18, right: 18),
                    child: InputField(
                      label: "Email",
                      icon: Icons.mail,
                      keypad: TextInputType.text,
                      // inputFormat: [
                      //   FilteringTextInputFormatter.digitsOnly,
                      //   LengthLimitingTextInputFormatter(10),
                      // ],
                      controller: emailcontroller,
                      validator: (value) => provider.emailValidator(value),
                    ),
                  ),
                  // const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 10, left: 18, right: 18),
                    child: InputField(
                      label: 'Password',
                      icon: Icons.lock,
                      controller: passcontroller,
                      isvisible: passObsecure,
                      eyeButton: IconButton(
                        onPressed: () {
                          setState(() {
                            passObsecure = !passObsecure;
                          });
                        },
                        icon: Icon(passObsecure
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      inputFormat: [LengthLimitingTextInputFormatter(16)],
                      validator: (value) => provider.passwordValidator(value),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account ??",
                        style: textStyle,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Signup_page()));
                        },
                        child: const Text(
                          '  SignUp',
                          style: TextStyle(
                              color: Color.fromARGB(255, 154, 60, 227),
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgotPassword()));
                      },
                      child: Text("Forgot Password ??")),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          login(emailcontroller.text.toString(),
                              passcontroller.text.toString());
                        } else {}
                        debugPrint(emailcontroller.text);
                        debugPrint(passcontroller.text);
                      },
                      child: const Text(
                        'Submit',
                        style: textStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
