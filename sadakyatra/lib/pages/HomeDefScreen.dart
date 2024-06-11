// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sadakyatra/Booking/booking_form.dart';
import 'package:sadakyatra/Booking/input_field.dart';
import 'package:sadakyatra/setups.dart';

class HomeDefScreen extends StatefulWidget {
  const HomeDefScreen({super.key});

  @override
  State<HomeDefScreen> createState() => _HomeDefScreenState();
}

class _HomeDefScreenState extends State<HomeDefScreen> {
  List<dynamic> dataItems = [
    {"product": "hi", "frequency": 1},
    {"product": "hello", "frequency": 2},
    {"product": "hey", "frequency": 3},
    {"product": "hola", "frequency": 4}
  ];

  var _value = -1;
  var departureDate = "select date";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          color: const Color.fromARGB(255, 213, 227, 239),
          width: double.infinity,
          height: double.infinity,
          child: Form(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Column(
                children: [
                  Card(
                    //surfaceTintColor: Colors.grey,
                    margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                    elevation: 8,
                    child: Column(
                      children: [
                        SizedBox(
                          //top space
                          height: 30,
                        ),
                        DropdownButtonFormField(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          validator: (value) {
                            if (value == -1) {
                              return "Please Choose Location";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              // enabledBorder: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(5),
                              //   borderSide: BorderSide(
                              //       color: Colors.grey.withOpacity(0.5),
                              //       width: 1.5),
                              // ),
                              // focusedBorder: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(5),
                              //   borderSide: BorderSide(
                              //       color: Colors.blue.withOpacity(1),
                              //       width: 2),
                              // ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: Colors.red.withOpacity(0.5),
                                    width: 2),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: Colors.red.withOpacity(1), width: 2),
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
                                child: Text("FROM -- Choose Location",style: TextStyle(fontSize: 15),),
                                value: -1),
                            DropdownMenuItem(child: Text("Tinkune"), value: 1),
                            DropdownMenuItem(child: Text("Gaushala"), value: 2),
                            DropdownMenuItem(child: Text("Kalanki"), value: 3),
                          ],
                        ),

                        // 2nd dropdown
                        SizedBox(
                          height: 20,
                        ),
                        //
                        DropdownButtonFormField(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          validator: (value) {
                            if (value == -1) {
                              return "Please Choose Location";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              // enabledBorder: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(5),
                              //   borderSide: BorderSide(
                              //       color: Colors.grey.withOpacity(0.5),
                              //       width: 1.5),
                              // ),
                              // focusedBorder: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(5),
                              //   borderSide: BorderSide(
                              //       color: Colors.blue.withOpacity(1),
                              //       width: 2),
                              // ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: Colors.red.withOpacity(0.5),
                                    width: 2),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: Colors.red.withOpacity(1), width: 2),
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
                                child: Text("TO -- Choose Location",style: TextStyle(fontSize: 15),),
                                value: -1),
                            DropdownMenuItem(child: Text("Tinkune"), value: 1),
                            DropdownMenuItem(child: Text("Gaushala"), value: 2),
                            DropdownMenuItem(child: Text("Kalanki"), value: 3),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Container(
                          margin: EdgeInsets.only(right: 200),
                          child: Text(
                            'Departure Date ',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: GestureDetector(
                            onTap: () async {
                              final selectedate = await showDatePicker(
                                context: context,
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(
                                  Duration(days: 30),
                                ),
                              );
                              if (selectedate != null) {
                                setState(() {
                                  departureDate = DateFormat("dd/MM/yyyy")
                                      .format(selectedate);
                                  print(selectedate);
                                  // departureDate = selectedate;
                                });
                              }
                            },
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    final selectedate = await showDatePicker(
                                      context: context,
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.now().add(
                                        Duration(days: 30),
                                      ),
                                    );
                                    if (selectedate != null) {
                                      setState(() {
                                        departureDate = DateFormat("dd/MM/yyyy")
                                            .format(selectedate);
                                        print(selectedate);
                                        // departureDate = selectedate;
                                      });
                                    }
                                  },
                                  icon: Icon(
                                    Icons.calendar_month_outlined,
                                    size: 30,
                                  ),
                                ),
                                Text("${departureDate}")
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          // bottom space
                          height: 15,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Search Bus',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 260.0,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      // ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: dataItems.length,
                      itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Container(
                              height: 200,
                              width: 300,
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "   ${dataItems[index]["frequency"].toString()}",
                                    style: textStyle,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 120,
                                    color: Color.fromARGB(255, 153, 203, 238),
                                    child: Text(
                                        dataItems[index]["product"].toString(),
                                        style: textStyle,
                                        textAlign: TextAlign.center),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const bookSeat()));
                                          },
                                          child: Text(
                                            'Book Now',
                                            style: textStyle,
                                          )),
                                    ],
                                  )
                                ],
                              )),
                        ),
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
