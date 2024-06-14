// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sadakyatra/Booking/seatbooking_form.dart';
import 'package:sadakyatra/Booking/package_booking.dart';
import 'package:sadakyatra/setups.dart';

class JourneyScreen extends StatefulWidget {
  const JourneyScreen({super.key});

  @override
  State<JourneyScreen> createState() => _JourneyScreenState();
}

class _JourneyScreenState extends State<JourneyScreen> {
  List<dynamic> dataItems = [
    {"product": "[product image1]", "frequency": "[Description1]"},
    {"product": "[product image2]", "frequency": "[Description2]"},
    {"product": "[product image3]", "frequency": "[Description3]"},
    {"product": "[product image4]", "frequency": "[Description4]"}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 202, 227, 247),
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
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
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.amberAccent[200],
                                          ),
                                          child: Text(
                                              dataItems[index]["product"]
                                                  .toString(),
                                              style: textStyle,
                                              textAlign: TextAlign.center),
                                        ),
                                      ),
                                      Text(
                                        "   ${dataItems[index]["frequency"].toString()}",
                                        style: textStyle,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        // crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const PackageBooking()));
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
