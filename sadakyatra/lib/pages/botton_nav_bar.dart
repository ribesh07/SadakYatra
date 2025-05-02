import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
// import 'package:sadakyatra/pages/HomeDefScreen.dart';
import 'package:sadakyatra/pages/Home_screen.dart';
import 'package:sadakyatra/pages/history.dart';
import 'package:sadakyatra/pages/setting_profile.dart';
import 'package:sadakyatra/setups.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _currentUser;
  String? uID;
  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  List<Widget> get _widgetOptions {
    return [
      // HomeScreen(userUId: uID),
      if (uID != null)
        HomeScreen(userUId: uID!)
      else
        const CircularProgressIndicator(),
      const MyTabbedPage(),
      const ProfileSetting(),
      // the argument tyoe 'String?' can;t be assigned to parameter type 'string'
    ];
  }

  void _onItemTapped(int Index) {
    setState(() {
      _selectedIndex = Index;
    });
  }

  Future<void> _fetchUserData() async {
    _currentUser = _auth.currentUser;
    if (_currentUser != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('sadakyatra')
          .doc('userDetailsDatabase')
          .collection('users')
          .doc(_currentUser!.uid)
          .get();
      setState(() {
        uID = userDoc['uid'].toString();
      });
    }
  }

  void backtoFirstnavbar(int Index) {
    setState(
      () {
        if (_selectedIndex == 0) {
          Navigator.pop(context);
        } else {
          _selectedIndex = 0;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarcolor,
        title: const Text('Sadak'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        //forceMaterialTransparency: true,
        // leading: Builder(
        //   builder: (BuildContext context) {
        //     return IconButton(
        //       icon: const Icon(Icons.arrow_back_ios_new),
        //       onPressed: () {
        //         backtoFirstnavbar(_selectedIndex);
        //       },
        //     );
        //   },
        // ),
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Color.fromARGB(255, 71, 76, 81),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
