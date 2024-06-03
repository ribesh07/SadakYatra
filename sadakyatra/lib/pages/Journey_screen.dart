// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class JourneyScreen extends StatefulWidget {
  const JourneyScreen({super.key});

  @override
  State<JourneyScreen> createState() => _JourneyScreenState();
}

class _JourneyScreenState extends State<JourneyScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: Center(
        child: Text("Journey Screen"),
      )),
    );
  }
}
