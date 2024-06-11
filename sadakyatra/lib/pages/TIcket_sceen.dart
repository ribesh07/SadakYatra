// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

//import 'dart:nativewrappers/_internal/vm/lib/async_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sadakyatra/Booking/input_field.dart';
import 'package:sadakyatra/Booking/provide.dart';
import 'package:sadakyatra/setups.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  var _value = -1;
  //final double toPay = 0.0;
  final namecontroller = TextEditingController();
  final provider = settingProvider();
  final phonecontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final departcontroller = TextEditingController();
  final destinationcontroller = TextEditingController();

  void initState() {
    super.initState();
  }

  void dispose() {
    namecontroller.dispose();
    phonecontroller.dispose();
    emailcontroller.dispose();
    departcontroller.dispose();
    destinationcontroller.dispose();
    provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromARGB(255, 158, 207, 248),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Card(
                    elevation: 8,
                    child: Column(
                      children: [
                        Text('Contact Details', style: textStyle),
                        //Name
                        InputField(
                          icon: Icons.person,
                          label: "Full Name",
                          keypad: TextInputType.text,
                          controller: namecontroller,
                          validator: (value) => provider.validator(
                              value, "full Name is required"),
                        ),

                        //phone Number
                        InputField(
                          icon: Icons.phone,
                          label: "+977",
                          keypad: TextInputType.number,
                          controller: phonecontroller,
                          inputFormat: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          validator: (value) => provider.phoneValidator(value),
                        ),
                        InputField(
                          icon: Icons.mail,
                          label: "Email",
                          controller: emailcontroller,
                          validator: (value) => provider.emailValidator(value),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //address detail
                  Card(
                    elevation: 8,
                    child: Column(
                      children: [
                        Text('Vehicle Type', style: textStyle),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButtonFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == -1) {
                                return "please select vehicle type";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.5),
                                      width: 1.5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      color: Colors.blue.withOpacity(1),
                                      width: 2),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      color: Colors.red.withOpacity(0.5),
                                      width: 2),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      color: Colors.red.withOpacity(1),
                                      width: 2),
                                ),
                                prefixIcon: Icon(Icons.car_rental)),
                            value: _value,
                            onChanged: (value) {
                              setState(() {
                                _value = value as int;
                                print(_value);
                              });
                            },
                            items: [
                              DropdownMenuItem(
                                  child: Text("--Choose Vehicle Type--"),
                                  value: -1),
                              DropdownMenuItem(child: Text("Bus"), value: 1),
                              DropdownMenuItem(child: Text("Car"), value: 2),
                              DropdownMenuItem(child: Text("Jeep"), value: 3),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        Text(
                          "Trip Deatil",
                          style: textStyle,
                        ),
                        InputField(
                          icon: Icons.add_location_alt_outlined,
                          label: "From",
                          keypad: TextInputType.text,
                          controller: departcontroller,
                          validator: (value) => provider.validator(
                              value, "please enter departure location"),
                        ),
                        InputField(
                          icon: Icons.add_location_alt_outlined,
                          label: "To",
                          keypad: TextInputType.text,
                          controller: destinationcontroller,
                          validator: (value) => provider.validator(
                              value, "please enter Destination location"),
                        ),
                      ],
                    ),
                  ),

                  //billing
                  // Card(
                  //   elevation: 10,
                  //   child: Container(
                  //     height: 100,
                  //     width: MediaQuery.of(context).size.width,
                  //     child: Column(
                  //       children: [
                  //         SizedBox(
                  //           height: 10,
                  //         ),
                  //         Text(
                  //           'Bill Amount',
                  //           style: textStyle,
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         SizedBox(
                  //           height: 10,
                  //         ),
                  //         Text(
                  //           "Amount : Rs.${toPay}",
                  //           style: TextStyle(fontSize: 18),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue),
                      child: TextButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  title: Text("Conformation"),
                                  content: Text("Confirm Reservation"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        //main Logic
                                        if (formkey.currentState!.validate()) {
                                        } else {}

                                        final snackBar = SnackBar(
                                          backgroundColor: Colors.green,
                                          elevation: 10,
                                          duration:
                                              Duration(milliseconds: 3000),
                                          content: const Text(
                                            "we will contact you soon",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                        Navigator.pop(context);
                                      },
                                      child: Text("Ok"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancel"),
                                    ),
                                  ],
                                );
                              },
                            );
                            print(namecontroller);
                          } else {}
                          // showDialog(
                          //   context: context,
                          //   builder: (_) {
                          //     return AlertDialog(
                          //       shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(10),
                          //       ),
                          //       title: Text("Conformation"),
                          //       content: Text("Confirm Reservation"),
                          //       actions: [
                          //         TextButton(
                          //           onPressed: () {
                          //             //main Logic
                          //             if (formkey.currentState!.validate()) {
                          //             } else {}

                          //             final snackBar = SnackBar(
                          //               backgroundColor: Colors.green,
                          //               elevation: 10,
                          //               duration: Duration(milliseconds: 3000),
                          //               content: const Text(
                          //                 "we will contact you soon",
                          //                 style: TextStyle(fontSize: 20),
                          //               ),
                          //             );
                          //             ScaffoldMessenger.of(context)
                          //                 .showSnackBar(snackBar);
                          //             Navigator.pop(context);
                          //           },
                          //           child: Text("Ok"),
                          //         ),
                          //         TextButton(
                          //             onPressed: () {
                          //               Navigator.pop(context);
                          //             },
                          //             child: Text("Cancel"))
                          //       ],
                          //     );
                          //   },
                          // );
                          // print(fullName);
                        },
                        child: Text(
                          "Submit",
                          textAlign: TextAlign.center,
                          style: textStyle,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
