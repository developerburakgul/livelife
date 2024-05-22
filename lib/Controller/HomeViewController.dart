import 'package:flutter/material.dart';
import 'package:livelife/Controller/HabitCreateViewController.dart';
import 'package:livelife/Models/task.dart';
import 'package:livelife/Views/Screens/HomeView.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:livelife/Views/Screens/HabitCreateView.dart'; // AddHabitPage import edildi

class HomeViewController extends StatefulWidget {
  final String userId;

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
    getTaskData();
  }

  void toggleCalendarView() {
    setState(() {
      _calendarFormat = _calendarFormat == CalendarFormat.month
          ? CalendarFormat.week
          : CalendarFormat.month;
    });
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }

  void getTaskData() async {
    print("getTaskData başladı");
    tasks = [
      Task(
        name: 'Task 1',
        description: 'This is a task description',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 5)),
        completionStatus: [false, true, false, false, false, true],
      ),
      Task(
        name: 'Task 2',
        description: 'This is another task description',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 7)),
        completionStatus: [false, false, true, false, true, false, true],
      ),
    ];
    setState(() {});
  }

  void editTask(Task task) {
    print("Edit task: ${task.name}");
    // Örnek olarak görev düzenleme işlemi
    // Gerçekte, görev düzenleme sayfasına yönlendirme yapılabilir
  }

  void deleteTask(Task task) {
    print("Delete task: ${task.name}");
    // Görevi silme işlemi
    setState(() {
      tasks = tasks?.where((t) => t != task).toList();
    });
  }

  void addHabit() async {
    // final result = await Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) => AddHabitPage(userId: widget.userId)),
    // );
    // if (result == true) {
    //   print("Habit updated or added.");
    //   getTaskData(); // Görev listesini güncelle
    // }

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HabitCreateViewController(userId: widget.userId),
      ),
    );

    // Handle the result if needed
    if (result == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Habit was successfully created!")),
      );
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
