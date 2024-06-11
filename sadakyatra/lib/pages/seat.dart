// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last, avoid_unnecessary_containers

//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sadakyatra/Booking/booking_form.dart';
import 'package:sadakyatra/pages/setups/seats_layout.dart';

import 'package:sadakyatra/setups.dart';

class SeatS extends StatefulWidget {
  const SeatS({super.key});

  @override
  State<SeatS> createState() => _SeatSState();
}

class _SeatSState extends State<SeatS> {
  //var index = [];
  var selectedseats = [];
  //1st Row
  bool _isSelectedL1 = false;
  bool _isBookedL1 = false;
  bool _isSelectedL2 = false;
  bool _isbookedL2 = false;
  bool _isSelectedR1 = false;
  bool _isBookedR1 = false;
  bool _isSelectedR2 = false;
  bool _isBookedR2 = false;
  //2nd Row
  bool _isSelectedL3 = false;
  bool _isBookedL3 = false;
  bool _isSelectedL4 = false;
  bool _isbookedL4 = false;
  bool _isSelectedR3 = false;
  bool _isBookedR3 = false;
  //3rd row
  bool _isSelectedR4 = false;
  bool _isBookedR4 = false;
  bool _isSelectedL5 = false;
  bool _isBookedL5 = false;
  bool _isSelectedL6 = false;
  bool _isbookedL6 = false;
  bool _isSelectedR5 = false;
  bool _isBookedR5 = false;
  bool _isSelectedR6 = false;
  bool _isBookedR6 = false;
  //4th Row
  bool _isSelectedL7 = false;
  bool _isBookedL7 = false;
  bool _isSelectedL8 = false;
  bool _isbookedL8 = false;
  bool _isSelectedR7 = false;
  bool _isBookedR7 = false;
  bool _isSelectedR8 = false;
  bool _isBookedR8 = false;
  //5th Row
  bool _isSelectedL9 = false;
  bool _isBookedL9 = false;
  bool _isSelectedL10 = false;
  bool _isbookedL10 = false;
  bool _isSelectedR9 = false;
  bool _isBookedR9 = false;
  bool _isSelectedR10 = false;
  bool _isBookedR10 = false;
  //6th Row
  bool _isSelectedL11 = false;
  bool _isBookedL11 = false;
  bool _isSelectedL12 = false;
  bool _isbookedL12 = false;
  bool _isSelectedR11 = false;
  bool _isBookedR11 = false;
  bool _isSelectedR12 = false;
  bool _isBookedR12 = false;
  // last row
  bool _isSelectedL13 = false;
  bool _isBookedL13 = false;
  bool _isSelectedL14 = false;
  bool _isbookedL14 = false;
  bool _isSelectedR13 = false;
  bool _isBookedR13 = false;
  bool _isSelectedR14 = false;
  bool _isBookedR14 = false;
  bool _isSelectedC1 = false;
  bool _isBookedC1 = false;
//..
//..
//..
// functions
  //1st Row left
  setSeatSelectedL1() {
    setState(() {
      if (_isBookedL1 == true) {
        //isbooked from database to update
        _isSelectedL1 = false;
      } else {
        _isSelectedL1 = !_isSelectedL1;
      }
    });
  }

  setSeatBookedL1() {
    setState(() {
      if (_isSelectedL1 == true) {
        _isBookedL1 = true;
      }
    });
  }

  setSeatSelectedL2() {
    setState(() {
      if (_isbookedL2 == true) {
        _isSelectedL2 = false;
      } else {
        _isSelectedL2 = !_isSelectedL2;
      }
    });
  }

  setSeatBookedL2() {
    setState(() {
      if (_isSelectedL2 == true) {
        _isbookedL2 = true;
      }
    });
  }

  // 1st Row right
  setSeatSelectedR1() {
    setState(() {
      if (_isBookedR1 == true) {
        _isSelectedR1 = false;
      } else {
        _isSelectedR1 = !_isSelectedR1;
      }
    });
  }

  setSeatBookedR1() {
    setState(() {
      if (_isSelectedR1 == true) {
        _isBookedR1 = true;
      }
    });
  }

  setSeatSelectedR2() {
    setState(() {
      if (_isBookedR2 == true) {
        _isSelectedR2 = false;
      } else {
        _isSelectedR2 = !_isSelectedR2;
      }
    });
  }

  setSeatBookedR2() {
    setState(() {
      if (_isSelectedR2 == true) {
        _isBookedR2 = true;
      }
    });
  }

  //2nd Row

  //2nd Row left
  setSeatSelectedL3() {
    setState(() {
      if (_isBookedL3 == true) {
        _isSelectedL3 = false;
      } else {
        _isSelectedL3 = !_isSelectedL3;
      }
    });
  }

  setSeatBookedL3() {
    setState(() {
      if (_isSelectedL3 == true) {
        _isBookedL3 = true;
      }
    });
  }

  setSeatSelectedL4() {
    setState(() {
      if (_isbookedL4 == true) {
        _isSelectedL4 = false;
      } else {
        _isSelectedL4 = !_isSelectedL4;
      }
    });
  }

  setSeatBookedL4() {
    setState(() {
      if (_isSelectedL4 == true) {
        _isbookedL4 = true;
      }
    });
  }

  //2nd Row right
  setSeatSelectedR3() {
    setState(() {
      if (_isBookedR3 == true) {
        _isSelectedR3 = false;
      } else {
        _isSelectedR3 = !_isSelectedR3;
      }
    });
  }

  setSeatBookedR3() {
    setState(() {
      if (_isSelectedR3 == true) {
        _isBookedR3 = true;
      }
    });
  }

  setSeatSelectedR4() {
    setState(() {
      if (_isBookedR4 == true) {
        _isSelectedR4 = false;
      } else {
        _isSelectedR4 = !_isSelectedR4;
      }
    });
  }

  setSeatBookedR4() {
    setState(() {
      if (_isSelectedR4 == true) {
        _isBookedR4 = true;
      }
    });
  }

  // 3rd row

  //3rd Row left

  setSeatSelectedL5() {
    setState(() {
      if (_isBookedL5 == true) {
        _isSelectedL5 = false;
      } else {
        _isSelectedL5 = !_isSelectedL5;
      }
    });
  }

  setSeatBookedL5() {
    setState(() {
      if (_isSelectedL5 == true) {
        _isBookedL5 = true;
      }
    });
  }

  setSeatSelectedL6() {
    setState(() {
      if (_isbookedL6 == true) {
        _isSelectedL6 = false;
      } else {
        _isSelectedL6 = !_isSelectedL6;
      }
    });
  }

  setSeatBookedL6() {
    setState(() {
      if (_isSelectedL6 == true) {
        _isbookedL6 = true;
      }
    });
  }

  // 3rd Row right
  setSeatSelectedR5() {
    setState(() {
      if (_isBookedR5 == true) {
        _isSelectedR5 = false;
      } else {
        _isSelectedR5 = !_isSelectedR5;
      }
    });
  }

  setSeatBookedR5() {
    setState(() {
      if (_isSelectedR5 == true) {
        _isBookedR5 = true;
      }
    });
  }

  setSeatSelectedR6() {
    setState(() {
      if (_isBookedR6 == true) {
        _isSelectedR6 = false;
      } else {
        _isSelectedR6 = !_isSelectedR6;
      }
    });
  }

  setSeatBookedR6() {
    setState(() {
      if (_isSelectedR6 == true) {
        _isBookedR6 = true;
      }
    });
  }

  //4th Row

  //4th Row left
  setSeatSelectedL7() {
    setState(() {
      if (_isBookedL7 == true) {
        _isSelectedL7 = false;
      } else {
        _isSelectedL7 = !_isSelectedL7;
      }
    });
  }

  setSeatBookedL7() {
    setState(() {
      if (_isSelectedL7 == true) {
        _isBookedL7 = true;
      }
    });
  }

  setSeatSelectedL8() {
    setState(() {
      if (_isbookedL8 == true) {
        _isSelectedL8 = false;
      } else {
        _isSelectedL8 = !_isSelectedL8;
      }
    });
  }

  setSeatBookedL8() {
    setState(() {
      if (_isSelectedL8 == true) {
        _isbookedL8 = true;
      }
    });
  }

  // 4th Row right
  setSeatSelectedR7() {
    setState(() {
      if (_isBookedR7 == true) {
        _isSelectedR7 = false;
      } else {
        _isSelectedR7 = !_isSelectedR7;
      }
    });
  }

  setSeatBookedR7() {
    setState(() {
      if (_isSelectedR7 == true) {
        _isBookedR7 = true;
      }
    });
  }

  setSeatSelectedR8() {
    setState(() {
      if (_isBookedR8 == true) {
        _isSelectedR8 = false;
      } else {
        _isSelectedR8 = !_isSelectedR8;
      }
    });
  }

  setSeatBookedR8() {
    setState(() {
      if (_isSelectedR8 == true) {
        _isBookedR8 = true;
      }
    });
  }

  //5th Row

  //5th Row left
  setSeatSelectedL9() {
    setState(() {
      if (_isBookedL9 == true) {
        _isSelectedL9 = false;
      } else {
        _isSelectedL9 = !_isSelectedL9;
      }
    });
  }

  setSeatBookedL9() {
    setState(() {
      if (_isSelectedL9 == true) {
        _isBookedL9 = true;
      }
    });
  }

  setSeatSelectedL10() {
    setState(() {
      if (_isbookedL10 == true) {
        _isSelectedL10 = false;
      } else {
        _isSelectedL10 = !_isSelectedL10;
      }
    });
  }

  setSeatBookedL10() {
    setState(() {
      if (_isSelectedL10 == true) {
        _isbookedL10 = true;
      }
    });
  }

  //5th Row right
  setSeatSelectedR9() {
    setState(() {
      if (_isBookedR9 == true) {
        _isSelectedR9 = false;
      } else {
        _isSelectedR9 = !_isSelectedR9;
      }
    });
  }

  setSeatBookedR9() {
    setState(() {
      if (_isSelectedR9 == true) {
        _isBookedR9 = true;
      }
    });
  }

  setSeatSelectedR10() {
    setState(() {
      if (_isBookedR10 == true) {
        _isSelectedR10 = false;
      } else {
        _isSelectedR10 = !_isSelectedR10;
      }
    });
  }

  setSeatBookedR10() {
    setState(() {
      if (_isSelectedR10 == true) {
        _isBookedR10 = true;
      }
    });
  }

  //6th Row

  //6th Row left

  setSeatSelectedL11() {
    setState(() {
      if (_isBookedL11 == true) {
        _isSelectedL11 = false;
      } else {
        _isSelectedL11 = !_isSelectedL11;
      }
    });
  }

  setSeatBookedL11() {
    setState(() {
      if (_isSelectedL11 == true) {
        _isBookedL11 = true;
      }
    });
  }

  setSeatSelectedL12() {
    setState(() {
      if (_isbookedL12 == true) {
        _isSelectedL12 = false;
      } else {
        _isSelectedL12 = !_isSelectedL12;
      }
    });
  }

  setSeatBookedL12() {
    setState(() {
      if (_isSelectedL12 == true) {
        _isbookedL12 = true;
      }
    });
  }

  // 6th Row right
  setSeatSelectedR11() {
    setState(() {
      if (_isBookedR11 == true) {
        _isSelectedR11 = false;
      } else {
        _isSelectedR11 = !_isSelectedR11;
      }
    });
  }

  setSeatBookedR11() {
    setState(() {
      if (_isSelectedR11 == true) {
        _isBookedR11 = true;
      }
    });
  }

  setSeatSelectedR12() {
    setState(() {
      if (_isBookedR12 == true) {
        _isSelectedR12 = false;
      } else {
        _isSelectedR12 = !_isSelectedR12;
      }
    });
  }

  setSeatBookedR12() {
    setState(() {
      if (_isSelectedR12 == true) {
        _isBookedR12 = true;
      }
    });
  }

  //last Row

  //last Row left
  setSeatSelectedL13() {
    setState(() {
      if (_isBookedL13 == true) {
        _isSelectedL13 = false;
      } else {
        _isSelectedL13 = !_isSelectedL13;
      }
    });
  }

  setSeatBookedL13() {
    setState(() {
      if (_isSelectedL13 == true) {
        _isBookedL13 = true;
      }
    });
  }

  setSeatSelectedL14() {
    setState(() {
      if (_isbookedL14 == true) {
        _isSelectedL14 = false;
      } else {
        _isSelectedL14 = !_isSelectedL14;
      }
    });
  }

  setSeatBookedL14() {
    setState(() {
      if (_isSelectedL14 == true) {
        _isbookedL14 = true;
      }
    });
  }

  // last Row right
  setSeatSelectedR13() {
    setState(() {
      if (_isBookedR13 == true) {
        _isSelectedR13 = false;
      } else {
        _isSelectedR13 = !_isSelectedR13;
      }
    });
  }

  setSeatBookedR13() {
    setState(() {
      if (_isSelectedR13 == true) {
        _isBookedR13 = true;
      }
    });
  }

  setSeatSelectedR14() {
    setState(() {
      if (_isBookedR14 == true) {
        _isSelectedR14 = false;
      } else {
        _isSelectedR14 = !_isSelectedR14;
      }
    });
  }

  setSeatBookedR14() {
    setState(() {
      if (_isSelectedR14 == true) {
        _isBookedR14 = true;
      }
    });
  }

  // last Row center
  setSeatSelectedC1() {
    setState(() {
      if (_isBookedC1 == true) {
        _isSelectedC1 = false;
      } else {
        _isSelectedC1 = !_isSelectedC1;
      }
    });
  }

  setSeatBookedC1() {
    setState(() {
      if (_isSelectedC1 == true) {
        _isBookedC1 = true;
      }
    });
  }

  resetBooked() {
    setState(() {
      _isSelectedL1 = false;
      _isBookedL1 = false;
      _isSelectedL2 = false;
      _isbookedL2 = false;
      _isSelectedR1 = false;
      _isBookedR1 = false;
      _isSelectedR2 = false;
      _isBookedR2 = false;
      //2nd Row
      _isSelectedL3 = false;
      _isBookedL3 = false;
      _isSelectedL4 = false;
      _isbookedL4 = false;
      _isSelectedR3 = false;
      _isBookedR3 = false;
      //3rd row
      _isSelectedR4 = false;
      _isBookedR4 = false;
      _isSelectedL5 = false;
      _isBookedL5 = false;
      _isSelectedL6 = false;
      _isbookedL6 = false;
      _isSelectedR5 = false;
      _isBookedR5 = false;
      _isSelectedR6 = false;
      _isBookedR6 = false;
      //4th Row
      _isSelectedL7 = false;
      _isBookedL7 = false;
      _isSelectedL8 = false;
      _isbookedL8 = false;
      _isSelectedR7 = false;
      _isBookedR7 = false;
      _isSelectedR8 = false;
      _isBookedR8 = false;
      //5th Row
      _isSelectedL9 = false;
      _isBookedL9 = false;
      _isSelectedL10 = false;
      _isbookedL10 = false;
      _isSelectedR9 = false;
      _isBookedR9 = false;
      _isSelectedR10 = false;
      _isBookedR10 = false;
      //6th Row
      _isSelectedL11 = false;
      _isBookedL11 = false;
      _isSelectedL12 = false;
      _isbookedL12 = false;
      _isSelectedR11 = false;
      _isBookedR11 = false;
      _isSelectedR12 = false;
      _isBookedR12 = false;
      // last row
      _isSelectedL13 = false;
      _isBookedL13 = false;
      _isSelectedL14 = false;
      _isbookedL14 = false;
      _isSelectedR13 = false;
      _isBookedR13 = false;
      _isSelectedR14 = false;
      _isBookedR14 = false;
      _isSelectedC1 = false;
      _isBookedC1 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 117, 182, 228),
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 8, right: 8),
        child: Container(
          height: 720,
          width: MediaQuery.of(context).size.width / 0.2,
          child: Card(
            elevation: 50,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Available:  ",
                              style: TextStyle(fontSize: 15),
                            ),
                            Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade500),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                      Container(
                        child: Text(
                          " Booked:",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade500),
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.shade500,
                          )),
                      Container(
                        child: Text(
                          "  Selected:",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade500),
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //1st Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //1st Row left
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedL1();
                          print(_isSelectedL1);
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'L1'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isBookedL1 //from db to update
                                  ? Colors.grey.shade500
                                  : _isSelectedL1
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),

                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedL2();
                          print(_isSelectedL2);
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'L2'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isbookedL2
                                  ? Colors.grey.shade500
                                  : _isSelectedL2
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      // 1st Row right
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedR1();
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'R1'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isBookedR1
                                  ? Colors.grey.shade500
                                  : _isSelectedR1
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedR2();
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'R2'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isBookedR2
                                  ? Colors.grey.shade500
                                  : _isSelectedR2
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // 2nd Row
                  Row(
                    children: [
                      //2nd Row left
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedL3();
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'L3'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isBookedL3
                                  ? Colors.grey.shade500
                                  : _isSelectedL3
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedL4();
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'L4'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isbookedL4
                                  ? Colors.grey.shade500
                                  : _isSelectedL4
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      // 2nd Row right
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedR3();
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'R3'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isBookedR3
                                  ? Colors.grey.shade500
                                  : _isSelectedR3
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedR4();
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'R4'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isBookedR4
                                  ? Colors.grey.shade500
                                  : _isSelectedR4
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //3rd Row

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //3rd Row left
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedL5();
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'L5'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isBookedL5
                                  ? Colors.grey.shade500
                                  : _isSelectedL5
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedL6();
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'L6'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isbookedL6
                                  ? Colors.grey.shade500
                                  : _isSelectedL6
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      // 3rd Row right
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedR5();
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'R5'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isBookedR5
                                  ? Colors.grey.shade500
                                  : _isSelectedR5
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedR6();
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'R6'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isBookedR6
                                  ? Colors.grey.shade500
                                  : _isSelectedR6
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //4th Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //4th Row left
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedL7();
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'L7'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isBookedL7
                                  ? Colors.grey.shade500
                                  : _isSelectedL7
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedL8();
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'L8'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isbookedL8
                                  ? Colors.grey.shade500
                                  : _isSelectedL8
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      // 4th Row right
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedR7();
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'R7'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isBookedR7
                                  ? Colors.grey.shade500
                                  : _isSelectedR7
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedR8();
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'R8'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isBookedR8
                                  ? Colors.grey.shade500
                                  : _isSelectedR8
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // 5th Row
                  Row(
                    children: [
                      //5th Row left
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedL9();
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'L9'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isBookedL9
                                  ? Colors.grey.shade500
                                  : _isSelectedL9
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedL10();
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'L10'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isbookedL10
                                  ? Colors.grey.shade500
                                  : _isSelectedL10
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      // 5th Row right
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedR9();
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'R9'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isBookedR9
                                  ? Colors.grey.shade500
                                  : _isSelectedR9
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedR10();
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'R10'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isBookedR10
                                  ? Colors.grey.shade500
                                  : _isSelectedR10
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //6th Row

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //6th Row left
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedL11();
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'L11'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isBookedL11
                                  ? Colors.grey.shade500
                                  : _isSelectedL11
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedL12();
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'L12'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isbookedL12
                                  ? Colors.grey.shade500
                                  : _isSelectedL12
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      // 6th Row right
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedR11();
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'R11'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isBookedR11
                                  ? Colors.grey.shade500
                                  : _isSelectedR11
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedR12();
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'R12'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isBookedR12
                                  ? Colors.grey.shade500
                                  : _isSelectedR12
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // last Row

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //last Row left
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedL13();
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'L13'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isBookedL13
                                  ? Colors.grey.shade500
                                  : _isSelectedL13
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedL14();
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'L14'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isbookedL14
                                  ? Colors.grey.shade500
                                  : _isSelectedL14
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),
                      // last Row center
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedC1();
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'C1'),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isBookedC1
                                  ? Colors.grey.shade500
                                  : _isSelectedC1
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),

                      // last  Row right
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedR13();
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'R14'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isBookedR13
                                  ? Colors.grey.shade500
                                  : _isSelectedR13
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setSeatSelectedR14();
                        },
                        child: Container(
                          child: SeatsLayout(ID: 'R15'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                              color: _isBookedR14
                                  ? Colors.grey.shade500
                                  : _isSelectedR14
                                      ? Colors.red
                                      : Colors.transparent),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  //bookButton

                  ElevatedButton(
                    onPressed: () async {
                      setSeatBookedL1();
                      setSeatBookedL2();
                      setSeatBookedR1();
                      setSeatBookedR2();
                      //2nd Row
                      setSeatBookedL3();
                      setSeatBookedL4();
                      setSeatBookedR3();
                      setSeatBookedR4();
                      //3rd Row
                      setSeatBookedL5();
                      setSeatBookedL6();
                      setSeatBookedR5();
                      setSeatBookedR6();
                      //4th Row
                      setSeatBookedL7();
                      setSeatBookedL8();
                      setSeatBookedR7();
                      setSeatBookedR8();
                      //5th Row
                      setSeatBookedL9();
                      setSeatBookedL10();
                      setSeatBookedR9();
                      setSeatBookedR10();
                      //6th Row
                      setSeatBookedL11();
                      setSeatBookedL12();
                      setSeatBookedR11();
                      setSeatBookedR12();
                      //last Row
                      setSeatBookedL13();
                      setSeatBookedL14();
                      setSeatBookedR13();
                      setSeatBookedR14();
                      setSeatBookedC1();

                      if (_isSelectedL1 == true ||
                          _isSelectedL2 == true ||
                          _isSelectedR1 ||
                          _isSelectedR2 ||
                          _isSelectedL3 == true ||
                          _isSelectedL4 == true ||
                          _isSelectedR3 ||
                          _isSelectedR4 ||
                          _isSelectedL5 == true ||
                          _isSelectedL6 == true ||
                          _isSelectedR5 ||
                          _isSelectedR6 ||
                          _isSelectedL7 == true ||
                          _isSelectedL8 == true ||
                          _isSelectedR7 ||
                          _isSelectedR8 ||
                          _isSelectedL9 == true ||
                          _isSelectedL10 == true ||
                          _isSelectedR9 ||
                          _isSelectedR10 ||
                          _isSelectedL11 == true ||
                          _isSelectedL12 == true ||
                          _isSelectedR11 ||
                          _isSelectedR12 ||
                          _isSelectedL13 == true ||
                          _isSelectedL14 == true ||
                          _isSelectedR13 ||
                          _isSelectedR14 ||
                          _isSelectedC1) {
                        String hello = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => bookSeat(),
                          ),
                        );

                        if (hello == 'hello') {
                          resetBooked();
                        }
                      }
                    },
                    child: Text('   Book   '),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
