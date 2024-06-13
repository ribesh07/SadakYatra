// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  final namecontroller = TextEditingController();
  final provider = settingProvider();
  final phonecontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final mailcontroller = TextEditingController();
  String trippin = 'titu mama';
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    namecontroller.dispose();
    phonecontroller.dispose();
    mailcontroller.dispose();
    provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'booking',
            textAlign: TextAlign.left,
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context, "hello");
              },
              icon: Icon(Icons.arrow_back)),
          // actions: [
          //    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new_sharp)),
          //   Text("data"),
          // ],
          backgroundColor: Color.fromARGB(255, 56, 149, 225),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
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
                        child: Column(
                          children: [
                            Text(
                              'Trip Details',
                              style: textStyle,
                              textAlign: TextAlign.center,
                            ),
                            Text('${trippin}'),
                          ],
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
                            controller: namecontroller,
                            inputFormat: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-z]'),
                              ),
                              LengthLimitingTextInputFormatter(50),
                            ],
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
                            validator: (value) =>
                                provider.phoneValidator(value),
                          ),
                          InputField(
                            icon: Icons.mail,
                            label: "Email",
                            controller: mailcontroller,
                            validator: (value) =>
                                provider.emailValidator(value),
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
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
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
                                    child: Text("--Choose Pickup Point"),
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
                            print(namecontroller);
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
      ),
    );
  }
}
