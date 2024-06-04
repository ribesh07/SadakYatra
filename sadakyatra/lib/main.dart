import 'package:flutter/material.dart';
import 'package:sadakyatra/pages/Home_screen.dart';
import 'package:sadakyatra/pages/botton_nav_bar.dart';
import 'package:sadakyatra/pages/login-page.dart';
import 'package:sadakyatra/pages/seat_plan.dart';
import 'package:sadakyatra/payments/esewa-pay.dart';
import 'package:sadakyatra/payments/khalti-pay.dart';
// import 'package:sadakyatra/payments/test_khalti.dart';
import 'package:sadakyatra/setups.dart';

void main() {
  //  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
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
        body: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 200),
                child: Text(
                  'MainPage',
                  style: textStyle,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const seatSelection()));
                  },
                  child: const Text(
                    "seat selection",
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
                            builder: (context) => const esewa_pay()));
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
                            builder: (context) => const khalti_pay()));
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
        ));
  }
}
