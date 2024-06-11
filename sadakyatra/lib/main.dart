import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sadakyatra/Booking/booking_form.dart';
import 'package:sadakyatra/firebase_options.dart';
import 'package:sadakyatra/pages/Home_screen.dart';
import 'package:sadakyatra/pages/botton_nav_bar.dart';
import 'package:sadakyatra/pages/login-page.dart';
import 'package:sadakyatra/pages/seat.dart';
import 'package:sadakyatra/pages/seat_plan.dart';
import 'package:sadakyatra/payments/App_khalti.dart';
import 'package:sadakyatra/payments/esewa-pay.dart';
import 'package:sadakyatra/payments/khalti-pay.dart';
// import 'package:sadakyatra/payments/test_khalti.dart';
import 'package:sadakyatra/setups.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 125, 78, 201),
          title: Container(
              alignment: Alignment.center,
              child: const Text(
                "SadakYatra",
                style: textStyleappbar,
              )),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            child: Center(
              child: Row(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const bookSeat(),
                              ),
                            );
                          },
                          child: const Text(
                            "book",
                            style: textStyle,
                          )),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login_page()));
                          },
                          child: const Text(
                            "Login User",
                            style: textStyle,
                          )),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const EsewaScreen()));
                          },
                          child: const Text(
                            "e-pay",
                            style: textStyle,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PaymentKhalti()));
                          },
                          child: const Text(
                            "khalti-pay",
                            style: textStyle,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BottomBar()));
                            // builder: (context) => const KhaltiSDKDemo()));
                          },
                          child: const Text(
                            "BottomNavBar",
                            style: textStyle,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                            // builder: (context) => const KhaltiSDKDemo()));
                          },
                          child: const Text(
                            "HomeScreen",
                            style: textStyle,
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SeatS()));
                            // builder: (context) => const KhaltiSDKDemo()));
                          },
                          child: const Text(
                            "Bookseat",
                            style: textStyle,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
