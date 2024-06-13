import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:livelife/Models/task.dart';
import 'package:livelife/Services/Exceptions/TaskException.dart';
import 'package:livelife/Services/task_service.dart';
import 'package:livelife/Utils/Extensions/ColorExtensions.dart';
import 'package:livelife/Views/CustomViews/ColorPickerDialog.dart';
import 'package:livelife/Views/Screens/HabitEditView.dart';
import 'package:livelife/Utils/UtilFunctions.dart';

class HabitEditViewController extends StatefulWidget {
  final String userId;
  final Task task; // Düzenlenecek Task nesnesi
  final TaskService taskService = TaskService();

  HabitEditViewController({
    Key? key,
    required this.userId,
    required this.task,
  }) : super(key: key);

  @override
  _HabitEditViewControllerState createState() =>
      _HabitEditViewControllerState();
}

class _HabitEditViewControllerState extends State<HabitEditViewController> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late DateTime _startDate;
  late DateTime _endDate;
  late TimeOfDay _reminderTime;
  late Color _backgroundColor;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.task.name);
    _descriptionController =
        TextEditingController(text: widget.task.description);
    _startDate = widget.task.startDate;
    _endDate = widget.task.endDate;
    _reminderTime = TimeOfDay.now();
    _backgroundColor = ColorExtensions.fromHex(widget.task.backgroundColor);
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
    String description = _descriptionController.text.trim();

    if (name.isEmpty || description.isEmpty) {
      showCustomPopup(
        context: context,
        title: 'Güncelleme Başarısız!',
        message: 'Tüm alanları doldurun',
        durationInSeconds: 1,
        showCheckMark: false,
      );
      return;
    }

    Task updatedTask = Task(
      name: name,
      description: description,
      startDate: _startDate,
      endDate: _endDate,
      backgroundColor: _backgroundColor.toHex(),
    );

    try {
      await widget.taskService
          .updateTask(widget.userId, widget.task, updatedTask);

      showCustomPopup(
        context: context,
        title: 'Güncelleme Başarılı!',
        message: 'Ana sayfaya yönlendiriliyorsunuz.',
        durationInSeconds: 1,
        showCheckMark: true,
        onPopupClose: () {
          Navigator.pop(
              context, true); // Güncelleme başarılı olursa true döndür
        },
      );
    } on TaskException catch (error) {
      showCustomPopup(
        context: context,
        title: 'Güncelleme Başarısız!',
        message: getTaskErrorMessage(error),
        durationInSeconds: 1,
        showCheckMark: false,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return HabitEditView(
      nameController: _nameController,
      descriptionController: _descriptionController,
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
