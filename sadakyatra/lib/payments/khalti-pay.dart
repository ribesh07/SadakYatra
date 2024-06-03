// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:sadakyatra/setups.dart';
import 'package:webview_flutter/webview_flutter.dart';

class khalti_pay extends StatefulWidget {
  const khalti_pay({super.key});

  @override
  State<khalti_pay> createState() => _khalti_payState();
}

class _khalti_payState extends State<khalti_pay> {

  final controller = WebViewController()..setJavaScriptMode(JavaScriptMode.disabled)
        ..loadRequest(Uri.parse("https://docs.khalti.com/"));

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