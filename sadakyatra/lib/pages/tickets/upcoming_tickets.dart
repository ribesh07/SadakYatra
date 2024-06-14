import 'package:flutter/material.dart';
import 'package:sadakyatra/setups.dart';

class ticketUpcoming extends StatefulWidget {
  const ticketUpcoming({super.key});

  @override
  State<ticketUpcoming> createState() => _ticketUpcomingState();
}

class _ticketUpcomingState extends State<ticketUpcoming> {
  List<dynamic> dataItems = [
    {"product": "[Trip Details1]", "frequency": "[Trip id1]"},
    {"product": "[Trip Details2]", "frequency": "[Trip id2]"},
    {"product": "[Trip Details3]", "frequency": "[Trip id3]"},
    {"product": "[Trip Details4]", "frequency": "[Trip id4]"}
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      child: ListView.builder(
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        // ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: dataItems.length,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: FittedBox(
            child: Card(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "   ${dataItems[index]["frequency"].toString()}",
                        style: textStyle,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 120,
                        color: Color.fromARGB(255, 201, 231, 246),
                        child: Text(dataItems[index]["product"].toString(),
                            style: textStyle, textAlign: TextAlign.center),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Card(
                          //   color: Color.fromARGB(255, 154, 199, 236),
                          //   child: TextButton(
                          //     onPressed: () {},
                          //     child: Text(
                          //       'Book',
                          //       style: TextStyle(
                          //           color: Colors.black, fontSize: 18),
                          //     ),
                          //   ),
                          // ),
                          // CustomTextButton("View Details"),

                          TextButton(
                            onPressed: () {},
                            child: Text('View Details', style: buttonStyle),
                          ),

                          TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      title: Text("Are You Sure?"),
                                      content: FittedBox(
                                        child: Container(
                                          height: 100,
                                          width: 200,
                                          child: Column(
                                            children: [
                                              Text(
                                                  'Cancellation charges will be applied'),
                                              SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  TextButton(
                                                    onPressed: () {
                                                      //update db

                                                      Navigator.pop(context);
                                                      final snackBar = SnackBar(
                                                        backgroundColor:
                                                            Colors.green,
                                                        elevation: 10,
                                                        duration: Duration(
                                                            milliseconds: 3000),
                                                        content: const Text(
                                                          "we will contact you soon",
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                        ),
                                                      );
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              snackBar);
                                                    },
                                                    child: Text('Yes'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('No'),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ));
                                },
                              );
                            },
                            child: Text(
                              'Cancel',
                              style: buttonStyle,
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
