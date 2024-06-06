// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sadakyatra/payments/esewa_function.dart';

class EsewaScreen extends StatelessWidget {
  const EsewaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Esewa Integration'),
        backgroundColor: const Color.fromRGBO(103, 58, 183, 1),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          Icon(
            Icons.paid,
            size: 300,
          ),
          Text(
            'Payment',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              child: const Text('Pay with E-Sewa'),
              onPressed: () {
                Esewa esewa = Esewa();
                esewa.pay(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
