import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:livelife/Screens/addHabit.dart';
import 'package:livelife/Screens/homePage.dart';
import 'package:livelife/Screens/intro.dart';
import 'package:livelife/Screens/login.dart';
import 'package:livelife/Screens/settings.dart';
import 'package:livelife/Screens/signUP.dart';
import 'package:livelife/Screens/timer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(); // Firebase başlatılıyor
  runApp(MyApp());
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




