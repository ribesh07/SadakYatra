// ignore_for_file: camel_case_types

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sadakyatra/pages/signup-page.dart';
import 'package:sadakyatra/setups.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  // final cpasscontroller = TextEditingController();

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
        title: Container(
            alignment: Alignment.center,
            child: const Text(
              'Login Page',
              style: textStyleappbar,
            )),
        backgroundColor: appbarcolor,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            color: Colors.blueGrey[100],
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
                  child: TextField(
                    controller: emailcontroller,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                // const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 10, left: 18, right: 18),
                  child: TextField(
                    controller: passcontroller,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
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
                      'Don\'t have an account ??',
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
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    onPressed: () {
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
    );
  }
}
