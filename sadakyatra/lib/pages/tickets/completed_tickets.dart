import 'package:flutter/material.dart';
import 'package:sadakyatra/setups.dart';

class CompletedTickets extends StatefulWidget {
  const CompletedTickets({super.key});

  @override
  State<CompletedTickets> createState() => _CompletedTicketsState();
}

class _CompletedTicketsState extends State<CompletedTickets> {
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
                      children: [],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
