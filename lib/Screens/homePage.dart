import 'package:flutter/material.dart';
import 'package:livelife/Models/task.dart';
import 'package:livelife/Screens/addHabit.dart';
import 'package:livelife/main.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  final String userId;

  HomePage({Key? key, required this.userId}) : super(key: key) {
    print('HomePage constructor called ');
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  List<Task>? tasks;

  @override
  void initState() {
    print("Homepage init state çalıştı");
    super.initState();
    getTaskData(); // Verileri yüklemek için
  }

  void _toggleCalendarView() {
    setState(() {
      _calendarFormat = _calendarFormat == CalendarFormat.month
          ? CalendarFormat.week
          : CalendarFormat.month;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Live Life')),
        ),
        body: ListView(
          children: <Widget>[
            // Week view calendar
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2040, 1, 1),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              onDaySelected: (selectedDay, focusedDay) {
                _onDaySelected(selectedDay, focusedDay);
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
              ),
              // Your other calendar styling
            ),
            IconButton(
              icon: Icon(
                Icons.expand_more,
                size: 25,
                color: Color.fromARGB(255, 58, 58, 58),
              ),
              onPressed: _toggleCalendarView, // Here's your onPress function
            ),
            // Motivational quote section
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Motivation Quote'),
              ),
            ),
            // Task List
            if (tasks != null)
              for (Task task in tasks!) TaskCard(title: task.name),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HabitCreatePage(userId: widget.userId)),
            );
            if (result == true) {
              print("result: $result");
              getTaskData();
            }
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
        )
        // bottomNavigationBar: bottomNavigationBar()
        );
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }

  void getTaskData() async {
    print("getTaskData başladı");
    // ! in here must be backend logic
  }
}

class TaskCard extends StatelessWidget {
  final String title;

  const TaskCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(title: Text(title)),
    );
  }
}



