// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sadakyatra/Booking/input_field.dart';
import 'package:sadakyatra/Booking/provide.dart';
import 'package:sadakyatra/setups.dart';

class bookSeat extends StatefulWidget {
  const bookSeat({super.key});

  @override
  State<bookSeat> createState() => _bookSeatState();
}

class _bookSeatState extends State<bookSeat> {
  var _value = -1;
  final double toPay = 0.0;
  final fullName = TextEditingController();
  final provider = settingProvider();
  final phone = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final email = TextEditingController();

  void initState() {
    super.initState();
  }

  void dispose() {
    fullName.dispose();
    phone.dispose();
    email.dispose();
    provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('booking'),
        backgroundColor: Color.fromARGB(255, 56, 149, 225),
      ),
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
                  Card(
                    elevation: 8,
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Trip Details',
                        style: textStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
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
                          controller: fullName,
                          validator: (value) => provider.validator(
                              value, "full Name is required"),
                        ),

                        //phone Number
                        InputField(
                          icon: Icons.phone,
                          label: "+977",
                          keypad: TextInputType.number,
                          controller: phone,
                          inputFormat: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          validator: (value) => provider.phoneValidator(value),
                        ),
                        InputField(
                          icon: Icons.mail,
                          label: "Email",
                          controller: email,
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
                        Text('Pickup Point', style: textStyle),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButtonFormField(
                            validator: (value) {
                              if (value == -1) {
                                return "please select pickup point";
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
                                prefixIcon:
                                    Icon(Icons.add_location_alt_outlined)),
                            value: _value,
                            onChanged: (value) {
                              setState(() {
                                _value = value as int;
                                print(_value);
                              });
                            },
                            items: [
                              DropdownMenuItem(
                                  child: Text("--Choose PickUp Point--"),
                                  value: -1),
                              DropdownMenuItem(
                                  child: Text("Tinkune"), value: 1),
                              DropdownMenuItem(
                                  child: Text("Gaushala"), value: 2),
                              DropdownMenuItem(
                                  child: Text("Kalanki"), value: 3),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //billing
                  Card(
                    elevation: 10,
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Bill Amount',
                            style: textStyle,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Amount : Rs.${toPay}",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
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
                          } else {}
                          print(fullName);
                        },
                        child: Text(
                          "Pay Now",
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
