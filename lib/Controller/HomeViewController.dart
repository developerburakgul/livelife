import 'package:flutter/material.dart';
import 'package:livelife/Controller/HabitCreateViewController.dart';
import 'package:livelife/Models/task.dart';
import 'package:livelife/Services/task_service.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:livelife/Views/Screens/HomeView.dart';
import 'package:livelife/Views/Screens/HabitCreateView.dart'; // AddHabitPage import edildi

class HomeViewController extends StatefulWidget {
  final String userId;
  final TaskService taskService = TaskService();

  HomeViewController({Key? key, required this.userId}) : super(key: key);

  @override
  _HomeViewControllerState createState() => _HomeViewControllerState();
}

class _HomeViewControllerState extends State<HomeViewController> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<Task>? tasks;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    getTaskData(_focusedDay);
  }

  void toggleCalendarView() {
    setState(() {
      _calendarFormat = _calendarFormat == CalendarFormat.month
          ? CalendarFormat.week
          : CalendarFormat.month;
    });
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) async {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });

    var newTasks = await widget.taskService
        .getTasksForUserOnDate(widget.userId, selectedDay);

    setState(() {
      tasks = newTasks;
    });
  }

  void getTaskData(DateTime date) async {
    var newTasks =
        await widget.taskService.getTasksForUserOnDate(widget.userId, date);

    setState(() {
      tasks = newTasks;
    });
  }

  void editTask(Task task) {}

  void deleteTask(Task task) {}

  void addHabit() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HabitCreateViewController(userId: widget.userId),
      ),
    );

    if (result == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Habit was successfully created!")),
      );
      getTaskData(
          _selectedDay!); // Yeni alışkanlık eklendikten sonra verileri güncelle
      print("Yeni görev eklendi ve veriler güncellendi.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return HomeView(
      calendarFormat: _calendarFormat,
      focusedDay: _focusedDay,
      selectedDay: _selectedDay,
      tasks: tasks,
      toggleCalendarView: toggleCalendarView,
      onDaySelected: onDaySelected,
      userId: widget.userId,
      onEditTask: editTask,
      onDeleteTask: deleteTask,
      onAddHabit: addHabit,
    );
  }
}
