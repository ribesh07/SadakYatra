// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sadakyatra/Booking/input_field.dart';
import 'package:sadakyatra/Booking/provide.dart';
import 'package:sadakyatra/setups.dart';

class CompletedTickets extends StatefulWidget {
  const CompletedTickets({super.key});

  @override
  State<CompletedTickets> createState() => _CompletedTicketsState();
}

class _CompletedTicketsState extends State<CompletedTickets> {
  final reviewcontroller = TextEditingController();
  final provider = settingProvider();
  final formkey = GlobalKey<FormState>();
  List<dynamic> dataItems = [
    {"product": "hi", "frequency": 1},
    {"product": "hello", "frequency": 2},
    {"product": "hey", "frequency": 3},
    {"product": "hola", "frequency": 4}
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
          child: Card(
            child: Container(
                height: 200,
                width: 300,
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
                      color: Color.fromARGB(255, 153, 203, 238),
                      child: Text(dataItems[index]["product"].toString(),
                          style: textStyle, textAlign: TextAlign.center),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text("View Details"),
                        ),
                        RatingBar(
                          ratingWidget: RatingWidget(
                              full: Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              half: Icon(Icons.star_half, color: Colors.amber),
                              empty: Icon(
                                Icons.star,
                                color: Colors.grey,
                              )),
                          onRatingUpdate: (rating) {
                            Future.delayed(Duration(milliseconds: 200), () {
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return Form(
                                    key: formkey,
                                    child: AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        title: Text("Write a review"),
                                        content: FittedBox(
                                          child: Container(
                                            //height: 100,
                                            width: MediaQuery.of(
                                              context,
                                            ).size.width,
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller: reviewcontroller,
                                                  maxLines: null,
                                                  minLines: 10,
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(
                                                        2000)
                                                  ],
                                                  onTapOutside: (event) {
                                                    //print('onTapOutside');
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  decoration: InputDecoration(
                                                    // label: Text('Review'),
                                                    hintText: "Review",
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      borderSide: BorderSide(
                                                          color: Colors.grey
                                                              .withOpacity(0.5),
                                                          width: 1.5),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      borderSide: BorderSide(
                                                          color: Colors.blue
                                                              .withOpacity(1),
                                                          width: 2),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      borderSide: BorderSide(
                                                          color: Colors.red
                                                              .withOpacity(0.4),
                                                          width: 1.5),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      borderSide: BorderSide(
                                                          color: Colors.red
                                                              .withOpacity(1),
                                                          width: 1.5),
                                                    ),
                                                  ),
                                                  validator: (value) =>
                                                      provider.validator(value!,
                                                          'Write review first'),
                                                ),
                                                SizedBox(height: 10),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        'Discard',
                                                        style: buttonStyle,
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        if (formkey
                                                            .currentState!
                                                            .validate()) {
                                                          //send to DB
                                                        } else {}
                                                      },
                                                      child: Text(
                                                        'Ok',
                                                        style: buttonStyle,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                  );
                                },
                              );
                            });
                            print(rating);
                          },
                          allowHalfRating: true,
                          tapOnlyMode: true,
                          glow: false,
                        ),
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
