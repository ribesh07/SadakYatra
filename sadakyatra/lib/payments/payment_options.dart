// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sadakyatra/payments/esewa-pay.dart';
import 'package:sadakyatra/payments/khalti-pay.dart';
import 'package:sadakyatra/setups.dart';

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({super.key});

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appbarcolor,
          title: Text(
            "Payment Options",
            style: textStyleappbar,
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color.fromARGB(255, 149, 203, 229),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EsewaScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Card(
                          // surfaceTintColor: Color.fromARGB(255, 115, 149, 222),
                          color: Color.fromARGB(255, 168, 172, 241),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Seats : [s1] [s2]",
                                    style: textStyle,
                                  ),
                                  Text(
                                    "Bus Number : xxxx",
                                    style: textStyle,
                                  ),
                                  Text(
                                    "Bus Contact Number :98XXXXXXXX",
                                    style: textStyle,
                                  ),
                                  Text(
                                    "To Pay : Rs.1000",
                                    style: textStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          child: Image(
                              image: AssetImage('assets/logos/esewa_logo.png')),
                        ),
                        Text(
                          "Pay With Esewa",
                          style: textStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PaymentKhalti()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          child: Image(
                              image: AssetImage('assets/logos/khalti.png')),
                        ),
                        Text(
                          "Pay With Khalti",
                          style: textStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
