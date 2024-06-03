// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:sadakyatra/setups.dart';
import 'package:webview_flutter/webview_flutter.dart';

class esewa_pay extends StatefulWidget {
  const esewa_pay({super.key});

  @override
  State<esewa_pay> createState() => _esewa_payState();
}

class _esewa_payState extends State<esewa_pay> {

  final controller = WebViewController()..setJavaScriptMode(JavaScriptMode.disabled)
        ..loadRequest(Uri.parse("https://google.com"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            alignment: Alignment.center,
            child:const Padding(
              padding:  EdgeInsets.only(right: 69),
              child:  Text(
                'e-Payment Page',
                style: textStyleappbar,
              ),
            )),
        backgroundColor: appbarcolor,
      ),
      body:
      Container(
        height: double.infinity,
        width: double.infinity,
        child: WebViewWidget(controller: controller),
        
      ),
    );
  }
}