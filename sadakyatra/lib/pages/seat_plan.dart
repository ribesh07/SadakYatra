// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:sadakyatra/setups.dart';

class seatSelection extends StatefulWidget {
  const seatSelection({super.key});

  @override
  State<seatSelection> createState() => _seatSelectionState();
}

class _seatSelectionState extends State<seatSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        elevation: 10,
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backgroundColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('seat'),
            ],
          ),
        ),
      ),
    );
  }
}
