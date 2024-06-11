// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, camel_case_types

import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sadakyatra/pages/account._page.dart';
import 'package:sadakyatra/setups.dart';
import 'package:toggle_switch/toggle_switch.dart';

class profileSetting extends StatefulWidget {
  const profileSetting({super.key});

  @override
  State<profileSetting> createState() => _profileSettingState();
}

class _profileSettingState extends State<profileSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomSheet: const Text("Version:1.0.1", style: textStyle),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 206, 226, 239),
          borderRadius: BorderRadius.circular(15),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              const CircleAvatar(
                backgroundColor: appbarcolor,
                radius: 46,
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              const Text(
                '{Name}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => accountUpdate(),
                      ),
                    );
                  },
                  child: FittedBox(
                    child: Card(
                      elevation: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 210),
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: FittedBox(
                    child: Card(
                      elevation: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Delete Account',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 165),
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 300,
              ),
              ToggleSwitch(
                minWidth: 50.0,
                minHeight: 40.0,
                initialLabelIndex: 0,
                cornerRadius: 20.0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                totalSwitches: 2,
                icons: [
                  Icons.brightness_2_outlined,
                  Icons.lightbulb,
                ],
                iconSize: 30.0,
                activeBgColors: [
                  [const Color.fromARGB(255, 0, 0, 0), Colors.black26],
                  [
                    Color.fromARGB(255, 235, 175, 115),
                    Color.fromARGB(230, 250, 191, 102)
                  ]
                ],
                animate:
                    true, // with just animate set to true, default curve = Curves.easeIn
                curve: Curves
                    .bounceInOut, // animate must be set to true when using custom curve
                onToggle: (index) {
                  print('switched to: $index');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
