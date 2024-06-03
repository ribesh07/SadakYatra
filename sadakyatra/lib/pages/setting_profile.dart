import 'package:flutter/material.dart';
import 'package:sadakyatra/pages/account._page.dart';

class profileSetting extends StatefulWidget {
  const profileSetting({super.key});

  @override
  State<profileSetting> createState() => _profileSettingState();
}

class _profileSettingState extends State<profileSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => accountUpdate()));
                    },
                    child: Text('edit'))),
          ],
        ),
      ),
    );
  }
}
