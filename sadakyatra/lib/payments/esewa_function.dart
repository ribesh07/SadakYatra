// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';

import 'package:flutter/material.dart';
import 'package:sadakyatra/pages/setups/snackbar_message.dart';
import 'package:sadakyatra/routes/app_route.dart';

const String kEsewaClientId =
    'JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R';
const String kEsewaSecretKey = 'BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==';

// eSewa ID: 9806800001/2/3/4/5
// Password: Nepal@123 MPIN: 1122 Token:123456

class Esewa {
  pay(BuildContext context) {
    try {
      EsewaFlutterSdk.initPayment(
        esewaConfig: EsewaConfig(
          environment: Environment.test,
          clientId: kEsewaClientId,
          secretId: kEsewaSecretKey,
        ),
        esewaPayment: EsewaPayment(
          productId: "1d71jd81",
          productName: "Product One",
          productPrice: "1000",
        ),
        onPaymentSuccess: (EsewaPaymentSuccessResult result) {
          debugPrint('SUCCESS');
          // final snackBar = SnackBar(
          //   content: Text('Payment Success '),
          // );
          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
          showSnackBarMsg(
            context: context,
            message: 'Payment success.',
            bgColor: Colors.green,
          );
          verify(result);
        },
        onPaymentFailure: () {
          debugPrint('FAILURE');
          showSnackBarMsg(
            context: context,
            message: 'Failed to pay.',
            bgColor: Colors.red,
          );
        },
        onPaymentCancellation: () {
          debugPrint('CANCEL');
          showSnackBarMsg(
            context: context,
            message: 'Canceled to payment proceed.',
            bgColor: Colors.pink,
          );
           Navigator.pushNamed(context, AppRoute.homeRoute);
        },
      );
    } catch (e) {
      debugPrint('EXCEPTION');
    }
  }

  verify(EsewaPaymentSuccessResult result) async {
    try {
      Dio dio = Dio();
      String basic =
          'Basic ${base64.encode(utf8.encode('JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R:BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ=='))}';
      Response response = await dio.get(
        'https://esewa.com.np/mobile/transaction',
        queryParameters: {
          'txnRefId': result.refId,
        },
        options: Options(
          headers: {
            'Authorization': basic,
          },
        ),
      );
      print(response.data);
    } catch (e) {
      print(e);
    }
  }
}
