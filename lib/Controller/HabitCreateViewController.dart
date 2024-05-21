import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:livelife/Models/task.dart';
import 'package:livelife/Views/Screens/HabitCreateView.dart';
import 'package:livelife/main.dart';

class HabitCreateViewController extends StatefulWidget {
  final String userId;

  HabitCreateViewController({Key? key, required this.userId}) : super(key: key);

  @override
  _HabitCreateViewControllerState createState() =>
      _HabitCreateViewControllerState();
}

class _HabitCreateViewControllerState extends State<HabitCreateViewController> {
  final TextEditingController _nameController = TextEditingController();
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 30));
  TimeOfDay _reminderTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return HabitCreateView(
      nameController: _nameController,
      startDate: _startDate,
      endDate: _endDate,
      reminderTime: _reminderTime,
      selectDate: (bool isStart) => _selectDate(context, isStart),
      selectTime: () => _selectTime(context),
      selectBackground: () => _selectBackground(context),
      onCancel: () => Navigator.pop(context),
      onSave: () => _saveHabit(),
    );
  }

  Future<void> _selectDate(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStart ? _startDate : _endDate,
      firstDate: isStart ? DateTime.now() : _startDate,
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != (isStart ? _startDate : _endDate)) {
      setState(() {
        if (isStart) {
          _startDate = picked;
          if (_startDate.isAfter(_endDate)) {
            _endDate = _startDate.add(Duration(days: 30));
          }
        } else {
          _endDate = picked;
        }
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _reminderTime,
    );
    if (picked != null && picked != _reminderTime) {
      setState(() {
        _reminderTime = picked;
      });
    }
  }

  Future<void> _selectBackground(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: Center(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.circle),
                  iconColor: Colors.blue,
                  title: Text('Mavi'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.circle),
                  iconColor: Colors.green,
                  title: Text('Yeşil'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.circle),
                  iconColor: Colors.red,
                  title: Text('Kırmızı'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _saveHabit() {
    // Here, add your logic to save the habit to a database or another service
    print('Habit Saved: ${_nameController.text}');
    print('Start Date: ${DateFormat('dd/MM/yyyy').format(_startDate)}');
    print('End Date: ${DateFormat('dd/MM/yyyy').format(_endDate)}');
    print('Reminder Time: ${_reminderTime.format(context)}');

    // Assuming you save the habit successfully
    Navigator.pop(context, true);
  }
}
