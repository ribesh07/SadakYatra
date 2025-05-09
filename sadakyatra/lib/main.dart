// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:sadakyatra/Booking/seatbooking_form.dart';
// import 'package:sadakyatra/EditDetails/edit-details.dart';
import 'package:sadakyatra/firebase_options.dart';
//import 'package:sadakyatra/pages/Home_screen.dart';
// import 'package:sadakyatra/pages/botton_nav_bar.dart';
// import 'package:sadakyatra/pages/chat-screen.dart';
import 'package:sadakyatra/pages/login-page.dart';
// import 'package:sadakyatra/pages/seat.dart';
// import 'package:sadakyatra/pages/seat_plan.dart';
import 'package:sadakyatra/payments/App_khalti.dart';
// import 'package:sadakyatra/payments/esewa-pay.dart';
// import 'package:sadakyatra/payments/khalti-pay.dart';
// import 'package:sadakyatra/payments/payment_options.dart';
// import 'package:sadakyatra/payments/test_khalti.dart';
// import 'package:sadakyatra/setups.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:sadakyatra/test2/extapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: App()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SadakYatra',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 7, 152, 230)),
        useMaterial3: true,
      ),
      home: const Login_page(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Login_page();
    // return Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: appbarcolor,
    //       title: const Text(
    //         "SadakYatra",
    //         style: textStyleappbar,
    //       ),
    //     ),
    //     body: Container(
    //       width: double.infinity,
    //       height: double.infinity,
    //       child: SingleChildScrollView(
    //         physics: BouncingScrollPhysics(
    //           parent: AlwaysScrollableScrollPhysics(),
    //         ),
    //         child: Center(
    //           child: Row(
    //             children: [
    //               Column(
    //                 children: [
    //                   const SizedBox(
    //                     height: 10,
    //                   ),
    //                   ElevatedButton(
    //                       onPressed: () {
    //                         // Navigator.push(
    //                         //   context,
    //                         //   MaterialPageRoute(
    //                         //     builder: (context) => const bookSeat(),
    //                         //   ),
    //                         // );
    //                       },
    //                       child: const Text(
    //                         "book",
    //                         style: textStyle,
    //                       )),
    //                   const SizedBox(
    //                     height: 40,
    //                   ),
    //                   ElevatedButton(
    //                       onPressed: () {
    //                         Navigator.push(
    //                             context,
    //                             MaterialPageRoute(
    //                                 builder: (context) => const Login_page()));
    //                       },
    //                       child: const Text(
    //                         "Login User",
    //                         style: textStyle,
    //                       )),
    //                   const SizedBox(
    //                     height: 40,
    //                   ),
    //                   ElevatedButton(
    //                       onPressed: () {
    //                         Navigator.push(
    //                             context,
    //                             MaterialPageRoute(
    //                                 builder: (context) => const EsewaScreen()));
    //                       },
    //                       child: const Text(
    //                         "e-pay",
    //                         style: textStyle,
    //                       )),
    //                   const SizedBox(
    //                     height: 10,
    //                   ),
    //                   ElevatedButton(
    //                       onPressed: () {
    //                         Navigator.push(
    //                             context,
    //                             MaterialPageRoute(
    //                                 builder: (context) =>
    //                                     const PaymentKhalti()));
    //                       },
    //                       child: const Text(
    //                         "khalti-pay",
    //                         style: textStyle,
    //                       )),
    //                   const SizedBox(
    //                     height: 10,
    //                   ),
    //                   ElevatedButton(
    //                       onPressed: () {
    //                         Navigator.push(
    //                             context,
    //                             MaterialPageRoute(
    //                                 builder: (context) => const BottomBar()));
    //                         // builder: (context) => const KhaltiSDKDemo()));
    //                       },
    //                       child: const Text(
    //                         "MainPage",
    //                         style: textStyle,
    //                       )),
    //                   const SizedBox(
    //                     height: 10,
    //                   ),
    //                   ElevatedButton(
    //                       onPressed: () {
    //                         // Navigator.push(
    //                         //     context,
    //                         //     MaterialPageRoute(
    //                         //         builder: (context) =>
    //                         //             const PaymentOptions()));
    //                         // builder: (context) => const KhaltiSDKDemo()));
    //                       },
    //                       child: const Text(
    //                         "extapp",
    //                         style: textStyle,
    //                       )),
    //                 ],
    //               ),
    //               Column(
    //                 children: [
    //                   //   ElevatedButton(
    //                   //       onPressed: () {
    //                   //         Navigator.push(
    //                   //             context,
    //                   //             MaterialPageRoute(
    //                   //                 builder: (context) =>
    //                   //                     SeatS(uniqueIDs: '1')));
    //                   //         // builder: (context) => const KhaltiSDKDemo()));
    //                   //       },
    //                   //       child: const Text(
    //                   //         "Bookseat",
    //                   //         style: textStyle,
    //                   //       )),
    //                   ElevatedButton(
    //                       onPressed: () {
    //                         Navigator.push(
    //                             context,
    //                             MaterialPageRoute(
    //                                 builder: (context) => editDetails()));
    //                       },
    //                       child: const Text(
    //                         "Edit profile",
    //                         style: textStyle,
    //                       )),
    //                   ElevatedButton(
    //                       onPressed: () {
    //                         Navigator.push(
    //                             context,
    //                             MaterialPageRoute(
    //                                 builder: (context) => ChatScreen()));
    //                       },
    //                       child: const Text(
    //                         "Chat-Screen",
    //                         style: textStyle,
    //                       )),
    //                 ],
    //               )
    //             ],
    //           ),
    //         ),
    //       ),
    //     ));
  }
}
