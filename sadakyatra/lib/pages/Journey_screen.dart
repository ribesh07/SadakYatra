// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sadakyatra/Booking/booking_form.dart';
import 'package:sadakyatra/setups.dart';

class JourneyScreen extends StatefulWidget {
  const JourneyScreen({super.key});

  @override
  State<JourneyScreen> createState() => _JourneyScreenState();
}

class _JourneyScreenState extends State<JourneyScreen> {
  List<dynamic> dataItems = [
    // {"product": "data", "frequency": 1},
    // {"product": "data2", "frequency": 2},
    // {"product": "data3", "frequency": 3},
    // {"product": "data4", "frequency": 4}
    {"product": "hi", "frequency": 1},
    {"product": "hello", "frequency": 2}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Our Package',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: dataItems.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                            elevation: 8,
                            child: Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width,
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
                                      color: Colors.amberAccent[200],
                                      child: Text(
                                          dataItems[index]["product"]
                                              .toString(),
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
                                ))),
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
    );
  }
}
