// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:sadakyatra/Booking/seatbooking_form.dart';
import 'package:sadakyatra/Booking/search_bus.dart';
//import 'package:sadakyatra/Booking/input_field.dart';
import 'package:sadakyatra/setups.dart';

class HomeDefScreen extends StatefulWidget {
  const HomeDefScreen({super.key});

  @override
  State<HomeDefScreen> createState() => _HomeDefScreenState();
}

class _HomeDefScreenState extends State<HomeDefScreen>
    with SingleTickerProviderStateMixin {
  var departurevalue = -1;
  var destinationvalue = -1;
  final formkey = GlobalKey<FormState>();
  int current = 0;
  List<dynamic> dataItemsAll = [];
  List<dynamic> dataItemsBLogs = [
    {"product": "[Image Blog1]", "frequency": 1},
    {"product": "[image Blog2]", "frequency": 2},
    {"product": "[image Blog3]", "frequency": 3},
    {"product": "[image Blog4]", "frequency": 4}
  ];
  List<dynamic> dataItemsNews = [
    {"product": "[image News1]", "frequency": 1},
    {"product": "[image News 2]", "frequency": 2},
    {"product": "[image News 3]", "frequency": 3},
    {"product": "[image news 4]", "frequency": 4}
  ];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < dataItemsBLogs.length; i++) {
      var temp = {
        'product': dataItemsBLogs[i]["product"],
        'frequency': dataItemsBLogs[i]["frequency"],
      };
      dataItemsAll.add(temp);
    }
    for (int i = 0; i < dataItemsNews.length; i++) {
      var temp = {
        'product': dataItemsNews[i]["product"],
        'frequency': dataItemsNews[i]["frequency"],
      };
      dataItemsAll.add(temp);
    }
  }

  double changeContainerColor() {
    switch (current) {
      case 0:
        return double.infinity;
      case 1:
        return double.infinity;
      case 2:
        return double.infinity;

      default:
        return 0;
    }
  }

  Container ChangeLayout() {
    switch (current) {
      case 0:
        return Container(
          child: SizedBox(
            height: 240.0,
            child: ListView.builder(
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              // ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: dataItemsAll.length,
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
                            "   ${dataItemsAll[index]["frequency"].toString()}",
                            style: textStyle,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: listColor,
                              ),
                              child: Text(
                                  dataItemsAll[index]["product"].toString(),
                                  style: textStyle,
                                  textAlign: TextAlign.center),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Read',
                                    style: buttonStyle,
                                  )),
                            ],
                          )
                        ],
                      )),
                ),
              ),
            ),
          ),
        );

      case 1:
        return Container(
          child: SizedBox(
            height: 240.0,
            child: ListView.builder(
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              // ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: dataItemsBLogs.length,
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
                            "   ${dataItemsBLogs[index]["frequency"].toString()}",
                            style: textStyle,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: listColor,
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 120,
                              child: Text(
                                  dataItemsBLogs[index]["product"].toString(),
                                  style: textStyle,
                                  textAlign: TextAlign.center),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Read',
                                    style: buttonStyle,
                                  )),
                            ],
                          )
                        ],
                      )),
                ),
              ),
            ),
          ),
        );

      case 2:
        return Container(
          child: SizedBox(
            height: 240.0,
            child: ListView.builder(
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              // ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: dataItemsNews.length,
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
                            "   ${dataItemsNews[index]["frequency"].toString()}",
                            style: textStyle,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: listColor,
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 120,
                              child: Text(
                                  dataItemsNews[index]["product"].toString(),
                                  style: textStyle,
                                  textAlign: TextAlign.center),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Read',
                                    style: buttonStyle,
                                  )),
                            ],
                          )
                        ],
                      )),
                ),
              ),
            ),
          ),
        );

      default:
        return Container();
    }
  }

  List<String> TabItem = [
    "All",
    "Blogs",
    "News",
  ];

  var _value = -1;
  var departureDate = "${DateFormat("dd/MM/yyyy").format(DateTime.now())}";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Column(
            children: [
              Form(
                key: formkey,
                child: Container(
                  color: backgroundColor,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
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
                                return "Please select pickup point";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
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
                                prefixIcon: Icon(departurevalue == -1
                                    ? Icons.add_location_alt_outlined
                                    : Icons.add_location_alt_sharp)),
                            //from destination
                            value: departurevalue,
                            onChanged: (value) {
                              setState(() {
                                departurevalue = value as int;
                                print(_value);
                              });
                            },
                            items: [
                              DropdownMenuItem(
                                  child: Text(
                                    "From",
                                    style: dropDownFirststyle,
                                  ),
                                  value: -1),
                              DropdownMenuItem(
                                  child: Text(
                                    "Kathmandu",
                                    style: dropDownTextStyle,
                                  ),
                                  value: 1),
                              DropdownMenuItem(
                                  child: Text(
                                    "Pokhara",
                                    style: dropDownTextStyle,
                                  ),
                                  value: 2),
                              DropdownMenuItem(
                                  child: Text(
                                    "Janakpur",
                                    style: dropDownTextStyle,
                                  ),
                                  value: 3),
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
                                prefixIcon: Icon(destinationvalue == -1
                                    ? Icons.add_location_alt_outlined
                                    : Icons.add_location_alt_sharp)),
                            value: destinationvalue,
                            onChanged: (value) {
                              setState(() {
                                destinationvalue = value as int;
                                print(_value);
                              });
                            },
                            items: [
                              DropdownMenuItem(
                                  child: Text(
                                    "To",
                                    style: dropDownFirststyle,
                                  ),
                                  value: -1),
                              DropdownMenuItem(
                                  child: Text(
                                    "Kathmandu",
                                    style: dropDownTextStyle,
                                  ),
                                  value: 1),
                              DropdownMenuItem(
                                  child: Text(
                                    "Pokhara",
                                    style: dropDownTextStyle,
                                  ),
                                  value: 2),
                              DropdownMenuItem(
                                  child: Text(
                                    "Janakpur",
                                    style: dropDownTextStyle,
                                  ),
                                  value: 3),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          Container(
                            margin: EdgeInsets.only(left: 10),
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Departure Date ',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),

                          //for calender icon tappable

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
                              // for making select date string tappable
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
                                          departureDate =
                                              DateFormat("dd/MM/yyyy")
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

                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue),
                              child: TextButton(
                                onPressed: () {
                                  if (formkey.currentState!.validate()) {
                                    if (departurevalue == destinationvalue) {
                                      final snackBar = SnackBar(
                                        backgroundColor:
                                            Color.fromARGB(255, 226, 5, 12),
                                        elevation: 10,
                                        duration: Duration(milliseconds: 3000),
                                        content: const Text(
                                          "Departure and Destination must be different",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    } else if (departurevalue == 1 &&
                                        destinationvalue == 2) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SearchBus(),
                                        ),
                                      );
                                    } else {}
                                  } else {}
                                },
                                child: Text(
                                  'Search Bus',
                                  style: textStyle,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                //height: 100,
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics(),
                        ),
                        itemCount: TabItem.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                current = index;

                                print(current);
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: index == current
                                      ? Colors.blue
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              width: 70,
                              child: Center(child: Text(TabItem[index])),
                            ),
                          );
                        },
                      ),
                    ),
                    AnimatedContainer(
                      //width: MediaQuery.of(context).size.width * 0.5,
                      width: changeContainerColor(),
                      //height: MediaQuery.of(context).size.height * 0.08,
                      duration: Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                          //color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(8)),
                      child: ChangeLayout(),
                    ),
                  ],
                ),
              )

              //   SizedBox(
              //     height: 260.0,
              //     child: ListView.builder(
              //       physics: BouncingScrollPhysics(
              //         parent: AlwaysScrollableScrollPhysics(),
              //       ),
              //       // ClampingScrollPhysics(),
              //       shrinkWrap: true,
              //       scrollDirection: Axis.horizontal,
              //       itemCount: dataItems.length,
              //       itemBuilder: (BuildContext context, int index) => Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Card(
              //           child: Container(
              //               height: 200,
              //               width: 300,
              //               child: Column(
              //                 // mainAxisAlignment: MainAxisAlignment.start,
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     "   ${dataItems[index]["frequency"].toString()}",
              //                     style: textStyle,
              //                   ),
              //                   Container(
              //                     width: MediaQuery.of(context).size.width,
              //                     height: 120,
              //                     color: Color.fromARGB(255, 153, 203, 238),
              //                     child: Text(
              //                         dataItems[index]["product"].toString(),
              //                         style: textStyle,
              //                         textAlign: TextAlign.center),
              //                   ),
              //                   Row(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceEvenly,
              //                     // crossAxisAlignment: CrossAxisAlignment.end,
              //                     children: [
              //                       ElevatedButton(
              //                           onPressed: () {
              //                             Navigator.push(
              //                                 context,
              //                                 MaterialPageRoute(
              //                                     builder: (context) =>
              //                                         const bookSeat()));
              //                           },
              //                           child: Text(
              //                             'Book Now',
              //                             style: textStyle,
              //                           )),
              //                     ],
              //                   )
              //                 ],
              //               )),
              //         ),
              //       ),
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
