import 'package:flutter/material.dart';
import 'package:livelife/Screens/Widgets/BottomNavigationBarWidget.dart';
import 'package:livelife/Screens/homePage.dart';
import 'package:livelife/Screens/settings.dart';
import 'package:livelife/Screens/timer.dart';

class MyHomePage extends StatefulWidget {
  final String userId;

  MyHomePage({Key? key, required this.userId}) : super(key: key) {
    print('MyHomePage constructor called $userId');
  }
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Create the list of widget options here within the build method
    List<Widget> _widgetOptions = [
      TimerScreen(),
      HomePage(userId: widget.userId), // Correctly pass widget.userId here
      SettingsPage(),
    ];

    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBarWidget(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ));
  }
}
