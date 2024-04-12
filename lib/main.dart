import 'package:flutter/material.dart';
import 'package:livelife/Screens/addHabit.dart';
import 'package:livelife/Screens/homePage.dart';
import 'package:livelife/Screens/intro.dart';
import 'package:livelife/Screens/login.dart';
import 'package:livelife/Screens/settings.dart';
import 'package:livelife/Screens/signUP.dart';
import 'package:livelife/Screens/timer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Live Life',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: IntroScreen());
  }
}

class bottomNavigationBar extends StatelessWidget {
  const bottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}
