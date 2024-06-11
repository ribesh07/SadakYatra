// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, file_names

import 'package:flutter/material.dart';
import 'package:sadakyatra/pages/HomeDefScreen.dart';
// import 'package:sadakyatra/main.dart';
import 'package:sadakyatra/pages/Journey_screen.dart';
import 'package:sadakyatra/pages/TIcket_sceen.dart';
import 'package:sadakyatra/setups.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Sada Yatra",
      //   ),
      //   centerTitle: true,
      //   backgroundColor: appbarcolor,
      // ),
      body: Container(
        color: Color.fromARGB(255, 230, 165, 240),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TabBar(
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: appbarcolor),
                      controller: _tabController,
                      //isScrollable: true,
                      labelPadding: EdgeInsets.only(right: 10, left: 10),
                      indicatorPadding: EdgeInsets.only(top: 5, bottom: 5),
                      //padding: EdgeInsets.symmetric(),
                      tabs: [
                        Container(
                          width: 100,
                          child: Tab(
                            height: 60,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.directions_bus_filled_outlined,
                                  size: 30,
                                ),
                                Text(
                                  'Bus Tickets',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          child: Tab(
                            height: 60,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.airport_shuttle_outlined,
                                  size: 30,
                                ),
                                Text(
                                  'Reservation',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          child: Tab(
                            height: 60,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.surfing_outlined,
                                  size: 30,
                                ),
                                Text(
                                  'Packages',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: [
                HomeDefScreen(),
                TicketScreen(),
                JourneyScreen(),
              ],
            )),
          ], //childrens
        ),
      ),
    );
  }
}
