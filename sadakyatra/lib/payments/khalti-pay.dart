// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:sadakyatra/pages/setups/snackbar_message.dart';
import 'package:sadakyatra/routes/app_route.dart';

class PaymentKhalti extends StatefulWidget {
  const PaymentKhalti({super.key});

  @override
  State<PaymentKhalti> createState() => _PaymentKhaltiState();
}

class _PaymentKhaltiState extends State<PaymentKhalti> {
  void openKhaltiPaymentView() {
    final config = PaymentConfig(
      amount: 100 * 100,
      productIdentity: 'ML123',
      productName: 'productName',
      productUrl: 'https://www.khalti.com/#/bazaar',
      additionalData: {
        'vendor': 'vendor name',
      },
      mobileReadOnly: false,
    );
    // KhaltiButton(
    //or manual as below
    KhaltiScope.of(context).pay(
      config: config,
      preferences: const [
        PaymentPreference.khalti,
        PaymentPreference.connectIPS,
        PaymentPreference.eBanking,
        PaymentPreference.mobileBanking,
        PaymentPreference.sct,
      ],
      onSuccess: (onSuccess) {
        showSnackBarMsg(
          context: context,
          message: 'Payment success.',
          bgColor: Colors.green,
        );
        Navigator.pushNamed(context, AppRoute.homeRoute);
      },
      onFailure: (onFailure) {
        showSnackBarMsg(
          context: context,
          message: 'Failed to pay.',
          bgColor: Colors.red,
        );
      },
      onCancel: () {
        showSnackBarMsg(
          context: context,
          message: 'Canceled to payment proceed.',
          bgColor: Colors.pink,
        );
        Navigator.pushNamed(context, AppRoute.homeRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Khalti"),
          backgroundColor: const Color.fromRGBO(103, 58, 183, 1),
          centerTitle: true,
        ),
        body: Container(
          child: Center(
            child: ElevatedButton(
                onPressed: () {
                  openKhaltiPaymentView();
                },
                child: Text("Pay with khalti")),
          ),
        ),
      ),
    );
  }
}
