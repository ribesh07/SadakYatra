// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sadakyatra/setups.dart';

class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({super.key});
  @override
  State<MyTabbedPage> createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Upcoming'),
    Tab(text: 'completed'),
    Tab(text: 'cancelled'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
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
      //   bottom: TabBar(
      //     controller: _tabController,
      //     tabs: myTabs,
      //   ),
      // ),
      body:
          // Container(
          //   child: TabBar(
          //     controller: _tabController,
          //     tabs: myTabs,
          //   ),
          // ),

          Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            // decoration: BoxDecoration(
            //   color: Colors.black.withOpacity(0.1),
            //   borderRadius: BorderRadius.circular(12),
            // ),
            child: TabBar(
              // indicator: BoxDecoration(
              //     borderRadius: BorderRadius.circular(6),
              //     color: appbarcolor),
              controller: _tabController,
              isScrollable: false,
              labelPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
              tabs: [
                Tab(
                  child: Text(
                    '  Upcoming    ',
                  ),
                ),
                Tab(
                  child: Text(
                    ' Completed   ',
                  ),
                ),
                Tab(
                  child: Text(
                    ' Cancelled ',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: [
              Text(
                '  Upcoming    ',
                style: textStyle,
              ),
              Text(
                ' Completed   ',
                style: textStyle,
              ),
              Text(
                ' Cancelled ',
                style: textStyle,
              ),
            ],
          )),
        ], //childrens
      ),
    );
  }
}
