// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:sadakyatra/Booking/input_field.dart';
import 'package:sadakyatra/setups.dart';

class HomeDefScreen extends StatefulWidget {
  const HomeDefScreen({super.key});

  @override
  State<HomeDefScreen> createState() => _HomeDefScreenState();
}

class _HomeDefScreenState extends State<HomeDefScreen> {
  var _value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        elevation: 10,
        child: Column(
          children: [
            Card(
              elevation: 8,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(label: Text("hola")),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
