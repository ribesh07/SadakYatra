// ignore_for_file: camel_case_types, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sadakyatra/Booking/booking_form.dart';
import 'package:sadakyatra/EditDetails/change_profile_pic.dart';
import 'package:sadakyatra/setups.dart';

class editDetails extends StatefulWidget {
  const editDetails({super.key});

  @override
  State<editDetails> createState() => _editDetailsState();
}

class _editDetailsState extends State<editDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit details',
          style: textStyleappbar,
        ),
        backgroundColor: Color.fromARGB(255, 205, 225, 243),
      ),
      body: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => changeProfilePic()),
                  );
                },
                child: FittedBox(
                  child: Card(
                    elevation: 10,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Change Profile Picture",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 90),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: FittedBox(
                  child: Card(
                    elevation: 10,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Change Email",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 183),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: FittedBox(
                  child: Card(
                    elevation: 10,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Change Username",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 130),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
