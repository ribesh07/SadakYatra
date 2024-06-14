// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:sadakyatra/Booking/package_booking.dart';
import 'package:sadakyatra/pages/seat.dart';
import 'package:sadakyatra/setups.dart';

class SearchBus extends StatefulWidget {
  const SearchBus({super.key});

  @override
  State<SearchBus> createState() => _SearchBusState();
}

class _SearchBusState extends State<SearchBus> {
  List<dynamic> dataItems = [
    {
      "product": "[Bus Details1]",
      "pricing": "[seat and price details1]",
      "frequency": "[Description1]"
    },
    {
      "product": "[Bus Details2]",
      "pricing": "[seat and price details2]",
      "frequency": "[Description2]"
    },
    {
      "product": "[Bus Details3]",
      "pricing": "[seat and price details3]",
      "frequency": "[Description3]"
    },
    {
      "product": "[Bus Details4]",
      "pricing": "[seat and price details4]",
      "frequency": "[Description4]"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search Bus",
          style: textStyleappbar,
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Color.fromARGB(255, 202, 227, 247),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SeatS()));
            },
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: dataItems.length,
                  //separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: FittedBox(
                              child: Card(
                                  elevation: 8,
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Color.fromARGB(
                                                    255, 104, 232, 159),
                                              ),
                                              child: Text(
                                                  dataItems[index]["product"]
                                                      .toString(),
                                                  style: textStyle,
                                                  textAlign: TextAlign.center),
                                            ),
                                          ),

                                          DottedLine(
                                            direction: Axis.horizontal,
                                            dashColor: Colors.grey,
                                            dashGapLength: 3,
                                            lineThickness: 3,
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Color.fromARGB(
                                                    255, 104, 232, 159),
                                              ),
                                              child: Text(
                                                  dataItems[index]["pricing"]
                                                      .toString(),
                                                  style: textStyle,
                                                  textAlign: TextAlign.center),
                                            ),
                                          ),
                                          // Text(
                                          //   "   ${dataItems[index]["frequency"].toString()}",
                                          //   style: textStyle,
                                          // ),
                                        ],
                                      ))),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
