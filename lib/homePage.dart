import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

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
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
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
          TaskCard(title: 'Task 1', progress: 0.3),
          TaskCard(title: 'Task 2', progress: 0.7),
          TaskCard(title: 'Task 3', progress: 0.5),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Zamanlayıcı',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Ekran',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ayarlar',
          ),
        ],
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String title;
  final double progress;

  const TaskCard({Key? key, required this.title, required this.progress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(title),
        subtitle: LinearProgressIndicator(
          value: progress,
        ),
      ),
    );
  }
}
