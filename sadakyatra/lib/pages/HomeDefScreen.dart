// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sadakyatra/setups.dart';

class HomeDefScreen extends StatefulWidget {
  const HomeDefScreen({super.key});

  @override
  State<HomeDefScreen> createState() => _HomeDefScreenState();
}

class _HomeDefScreenState extends State<HomeDefScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('HomeDefScreen',style: textStyle,),
      ),
    );
  }
}