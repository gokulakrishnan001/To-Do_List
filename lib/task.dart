import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  _taskState createState() => _taskState();
}

class _taskState extends State<Task> {
  String dropdownvalue = 'Wake Up';

  final timePicker = TextEditingController();

  var tasklist = [
    'Wake Up',
    'Go to Gym',
    'Breakfast',
    'Meetings',
    'Lunch',
    'Quick Nap',
    'Go TO Library',
    'Dinner',
    'Sleep',
  ];

  Time _time = Time(hour: 0, minute: 0, second: 0);

  void onTimeChaged(Time time) {
    setState(() {
      _time = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
                value: dropdownvalue,
                dropdownColor: Theme.of(context).cardColor,
                iconEnabledColor: Colors.black,
                iconDisabledColor: Colors.grey,
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: tasklist.map((String tasklist) {
                  return DropdownMenuItem(
                    value: tasklist,
                    child: Text(tasklist),
                  );
                }).toList(),
                onChanged: (String? newTask) {
                  setState(
                    () => dropdownvalue = newTask!,
                  );
                }),
            const SizedBox(
              height: 20.00,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(showPicker(
                      context: context,
                      value: _time,
                      onChange: onTimeChaged,
                      is24HrFormat: false));
                },
                child: const Text("Select a Time To Do Work")),
            const SizedBox(
              height: 20.00,
            ),
            Text("Your Seleted Task: $dropdownvalue"),
            const SizedBox(
              height: 20.00,
            ),
            Text("Your Selected Time: ${_time.format(context)}"),
            const SizedBox(
              height: 20.00,
            ),
            TextButton(
                onPressed: () {
                  int hour = _time.hour.toInt();
                  int minutes = _time.minute.toInt();
                  FlutterAlarmClock.createAlarm(hour, minutes);
                },
                child: const Text("SET ALARM")),
            const SizedBox(
              height: 20.00,
            ),
            ElevatedButton(
                onPressed: () {
                  FlutterAlarmClock.showAlarms();
                },
                child: const Text("Show Alarm"))
          ],
        ),
      ),
    );
  }
}
