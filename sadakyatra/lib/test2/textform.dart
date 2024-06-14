import 'package:flutter/material.dart';

class Textformtest extends StatefulWidget {
  const Textformtest({super.key});

  @override
  State<Textformtest> createState() => _TextformtestState();
}

class _TextformtestState extends State<Textformtest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        child: TextFormField(
          decoration: InputDecoration(label: Text("hola"), hintText: "hola"),
          onTap: () {
            items:
            [
              DropdownMenuItem(child: Text("To"), value: -1),
              DropdownMenuItem(child: Text("Tinkune"), value: 1),
              DropdownMenuItem(child: Text("Gaushala"), value: 2),
              DropdownMenuItem(child: Text("Kalanki"), value: 3),
            ];
          },
        ),
      ),
    );
  }
}
