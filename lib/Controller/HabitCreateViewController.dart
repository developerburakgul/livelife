import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:livelife/Models/task.dart';
import 'package:livelife/Services/Exceptions/TaskException.dart';
import 'package:livelife/Services/task_service.dart';
import 'package:livelife/Utils/Extensions/ColorExtensions.dart';
import 'package:livelife/Views/CustomViews/ColorPickerDialog.dart';
import 'package:livelife/Views/Screens/HabitCreateView.dart';
import 'package:livelife/Utils/UtilFunctions.dart';

class HabitCreateViewController extends StatefulWidget {
  final String userId;
  final TaskService taskService = TaskService();

  HabitCreateViewController({Key? key, required this.userId}) : super(key: key);

  @override
  _HabitCreateViewControllerState createState() =>
      _HabitCreateViewControllerState();
}

class _HabitCreateViewControllerState extends State<HabitCreateViewController> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController =
      TextEditingController(); // Description controller
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 30));
  TimeOfDay _reminderTime = TimeOfDay.now();
  Color _backgroundColor = Colors.white; // Varsayılan renk beyaz

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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ColorPickerDialog(
          onColorSelected: (Color color) {
            setState(() {
              _backgroundColor = color;
            });
          },
        );
      },
    );
  }

  Future<void> _saveHabit() async {
    String name = _nameController.text.trim();
    String description = _descriptionController.text.trim(); // Description text

    if (name.isEmpty || description.isEmpty) {
      showCustomPopup(
        context: context,
        title: 'Kaydetme Başarısız!',
        message: 'Tüm alanları doldurun',
        durationInSeconds: 1,
        showCheckMark: false,
      );
      return;
    }

    Task newTask = Task(
      name: name,
      description: description,
      startDate: _startDate,
      endDate: _endDate,
      backgroundColor: _backgroundColor.toHex(), // Renk hex formatında
    );

    try {
      await widget.taskService.addTaskToUser(widget.userId, newTask);
      showCustomPopup(
        context: context,
        title: 'Kaydetme Başarılı!',
        message: 'Ana sayfaya yönlendiriliyorsunuz.',
        durationInSeconds: 1,
        showCheckMark: true,
        onPopupClose: () {
          Navigator.pop(context, true);
        },
      );
    } on TaskException catch (error) {
      showCustomPopup(
        context: context,
        title: 'Kaydetme Başarısız!',
        message: getTaskErrorMessage(error),
        durationInSeconds: 1,
        showCheckMark: false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return HabitCreateView(
      nameController: _nameController,
      descriptionController: _descriptionController, // Description controller
      startDate: _startDate,
      endDate: _endDate,
      reminderTime: _reminderTime,
      selectDate: (bool isStart) => _selectDate(context, isStart),
      selectTime: () => _selectTime(context),
      selectBackground: () => _selectBackground(context),
      onCancel: () => Navigator.pop(context),
      onSave: _saveHabit,
    );
  }
}

