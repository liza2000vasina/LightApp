import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  String currentDay;
  List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  @override
  void initState() {
    super.initState();
    currentDay = days[0];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 300,
          child: CupertinoDatePicker(
            initialDateTime: DateTime.now(),
            onDateTimeChanged: (DateTime date) {},
            use24hFormat: true,
            minuteInterval: 1,
            mode: CupertinoDatePickerMode.dateAndTime,
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 20)),
        TextButton(
          onPressed: () => {},
          child: Text(
            'Submit',
            style: TextStyle(fontSize: 33, color: Colors.pink),
          ),
        )
      ],
    );
  }
}
